//
//  Copyright (c) 2018 faylib.top
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "FLModel.h"
#import <objc/runtime.h>

///调试模式
static BOOL DEBUG_MODE = NO;

typedef NS_ENUM(NSUInteger, FLModelLog) {
    FLModelLogIsNotDataOrDictionary,
    FLModelLogIsNotDataOrString,
    FLModelLogParseJSONFailure,
    FLModelLogParseXMLFailure,
    FLModelLogFoundUndefinedKey,
    FLModelLogPropertyConverted,
};

@interface FLModel () <NSXMLParserDelegate>

///未声明属性
@property (strong, nonnull) NSMutableDictionary *undefinedProperty;
///节点
@property (strong, nonatomic) NSMutableArray    *elements;
///节点名
@property (strong, nonatomic) NSMutableString   *elementName;

@end

@implementation FLModel (Log)

#pragma mark - Private Methods (Log)

- (void)debugLog:(FLModelLog)log
{
    [self debugLog:log info:nil];
}

- (void)debugLog:(FLModelLog)log info:(id)info, ...
{
    if (!DEBUG_MODE) { // 调试模式被关闭
        return;
    }
    
    NSMutableArray *infoArr = [NSMutableArray array];
    [infoArr addObject:info];
    va_list list;
    va_start(list, info);
    while (info != nil) {
        id arg = va_arg(list, id);
        if (!arg) break;
        [infoArr addObject:arg];
    }
    va_end(list);
    
    if (log == FLModelLogIsNotDataOrDictionary) {
        NSLog(@"[ MODEL ][ ERROR ] The JSON object must be type of 'NSDictionary' or 'NSData'.");
        NSLog(@"[ -> ][ CLASS ] %@", [self classForCoder]);
    } else if (log == FLModelLogIsNotDataOrString) {
        NSLog(@"[ MODEL ][ ERROR ] The XML object must be type of 'NSString' or 'NSData'.");
        NSLog(@"[ -> ][ CLASS ] %@", [self classForCoder]);
    } else if (log == FLModelLogParseJSONFailure) {
        NSLog(@"[ MODEL ][ ERROR ] The JSON object can't be parsed.");
        NSLog(@"[ -> ][ CLASS ] %@", [self classForCoder]);
    } else if (log == FLModelLogParseXMLFailure) {
        NSLog(@"[ MODEL ][ ERROR ] The XML object can't be parsed.");
        NSLog(@"[ -> ][ CLASS ] %@", [self classForCoder]);
    } else if (log == FLModelLogFoundUndefinedKey) {
        NSLog(@"[ MODEL ][ WARNING ] Found undefined key when parsing.");
        NSLog(@"[ -> ][ CLASS ] %@", [self classForCoder]);
        NSLog(@"[ -> ][ -> ][ KEY ] %@", infoArr[0]);
        NSLog(@"[ -> ][ -> ][ TYPE ] %@", infoArr[1]);
        NSLog(@"[ -> ][ -> ][ VALUE ] %@", infoArr[2]);
    } else if (log == FLModelLogPropertyConverted) {
        NSLog(@"[ MODEL ][ INFO ] Property name converted.");
        NSLog(@"[ -> ][ CLASS ] %@", [self classForCoder]);
        NSLog(@"[ -> ][ -> ][ BEFORE ] %@", infoArr[0]);
        NSLog(@"[ -> ][ -> ][ AFTER ] %@", infoArr[1]);
    }
}

@end


@implementation FLModel (Property)

#pragma mark - Private Methods (Property)

//获取属性列表
- (NSArray *)getPropertyList:(Class)cls
{
    unsigned int propertyCount = 0;
    NSMutableArray *propertyArray = [NSMutableArray array];
    objc_property_t *propertyList = class_copyPropertyList(cls, &propertyCount);
    
    if (propertyList != NULL) {
        for (unsigned int i = 0; i < propertyCount; i++) {
            //获取属性名并存入到数组中
            NSString *key = [NSString stringWithUTF8String:property_getName(propertyList[i])];
            [propertyArray addObject:key];
        }
    }
    //释放对象
    free(propertyList);
    
    return propertyArray;
}

@end


@implementation FLModel (JSON)

#pragma mark - Private Methods (JSON)

///解析JSON
- (void)parseJSON:(id)JSON
{
    if ([JSON isKindOfClass:[NSDictionary class]]) {
        //将键值设置为属性（解析JSON）
        [self setValuesForKeysWithDictionary:JSON];
        
        //更改未声明的属性的属性名
        [self undefinedKeyConvert];
        
        //剩余的未声明的属性
        [self undefinedKey];
    } else if ([JSON isKindOfClass:[NSData class]]) {
        NSError *error;
        JSON = [NSJSONSerialization JSONObjectWithData:JSON options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            [self debugLog:FLModelLogParseJSONFailure];
        } else {
            
            //将键值设置为属性（解析JSON）
            [self setValuesForKeysWithDictionary:JSON];
            
            //更改未声明的属性的属性名
            [self undefinedKeyConvert];
            
            //剩余的未声明的属性
            [self undefinedKey];
        }
    } else {
        [self debugLog:FLModelLogIsNotDataOrDictionary];
    }
}

//获取未被声明的键值
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if (!self.undefinedProperty) {
        self.undefinedProperty = [NSMutableDictionary dictionary];
    }
    [self.undefinedProperty setValue:value forKey:key];
}

///更改未声明的属性的属性名
- (void)undefinedKeyConvert
{
    __weak __typeof__(self) weakSelf = self;
    [self.undefinedProperty enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        __typeof__(weakSelf) self = weakSelf;
        if ([self propertyConvert]) {//转换属性名
            NSDictionary *conversionTable = [self propertyConvert];
            for (int i=0; i < conversionTable.count; i++) {
                NSString *beforeRename = conversionTable.allKeys[i];
                NSString *afterRename = conversionTable.allValues[i];
                if ([key isEqualToString:beforeRename]) {
                    [self setValue:obj forKeyPath:afterRename];
                    [self.undefinedProperty removeObjectForKey:key];
                    [self debugLog:FLModelLogPropertyConverted info:beforeRename, afterRename, nil];
                }
            }
        }
    }];
}

///剩余的未声明的属性
- (void)undefinedKey
{
    __weak __typeof__(self) weakSelf = self;
    [self.undefinedProperty enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        __typeof__(weakSelf) self = weakSelf;
        [self debugLog:FLModelLogFoundUndefinedKey info:key, [obj classForCoder], obj, nil];
    }];
}

@end


@implementation FLModel (XML)

#pragma mark - Private Methods (XML)

///解析XML
- (void)parseXML:(id)XML
{
    //节点
    if (!self.elements) self.elements = [[NSMutableArray alloc] init];
    [self.elements addObject:[NSMutableDictionary dictionary]];
    
    //节点名
    if (!self.elementName) self.elementName = [[NSMutableString alloc] init];
    
    //判断数据类型
    if ([XML isKindOfClass:[NSData class]]) {
        if ([self XMLParser:XML]) { //解析XML
            self.JSON = self.elements[0];
        } else {
            [self debugLog:FLModelLogParseXMLFailure];
        }
    } else if ([XML isKindOfClass:[NSString class]]) {
        XML = [XML dataUsingEncoding:NSUTF8StringEncoding];
        if ([self XMLParser:XML]) { //解析XML
            self.JSON = self.elements[0];
        } else {
            [self debugLog:FLModelLogParseXMLFailure];
        }
    } else {
        [self debugLog:FLModelLogIsNotDataOrString];
    }
}

- (BOOL)XMLParser:(id)XML
{
    //XML解析器
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:XML];
    parser.delegate = self;
    return [parser parse];
}


#pragma mark - NSXMLParserDelegate Methods

//读取节点头
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    //父节点
    NSMutableDictionary *parentElement = [self.elements lastObject];
    
    //子节点
    NSMutableDictionary *childElement = [NSMutableDictionary dictionary];
    [childElement addEntriesFromDictionary:attributeDict];
    
    //将节点转为字典的键值
    id value = parentElement[elementName];
    if (value) {
        NSMutableArray *array = nil;
        if ([value isKindOfClass:[NSMutableArray class]]) {
            array = (NSMutableArray *)value;
        } else {
            array = [NSMutableArray array];
            [array addObject:value];
            [parentElement setObject:array forKey:elementName];
        }
        [array addObject:childElement];
    } else {
        [parentElement setObject:childElement forKey:elementName];
    }
    [self.elements addObject:childElement];
}

//读取节点尾
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSMutableDictionary *dictionary = self.elements.lastObject;
    
    if (self.elementName.length > 0) { //剪切字符串，去掉空白和换行
        NSString *string = [self.elementName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [dictionary setObject:string forKey:elementName];
        self.elementName = [NSMutableString new];
    }
    [self.elements removeLastObject];
}

//读取节点中的值
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [self.elementName appendString:string];
}

@end


@implementation FLModel

#pragma mark - Life Cycle

//初始化
- (instancetype)initWithJSON:(id)JSON
{
    self.JSON = JSON;
    return [self init];
}

//初始化
+ (instancetype)modelWithJSON:(id)JSON
{
    return [[self alloc] initWithJSON:JSON];
}

//初始化
- (instancetype)initWithXML:(id)XML
{
    self.XML = XML;
    return [self init];
}

//初始化
+ (instancetype)modelWithXML:(id)XML
{
    return [[self alloc] initWithXML:XML];
}

//初始化
+ (instancetype)model
{
    return [[self alloc] init];
}


#pragma mark - Setter/Getter Methods

//JSON数据
- (void)setJSON:(id)JSON
{
    _JSON = JSON;
    [self parseJSON:JSON];
}

//XML数据
- (void)setXML:(id)XML
{
    _XML = XML;
    [self parseXML:XML];
}


#pragma mark - Public Methods

//属性转换
- (NSDictionary *)propertyConvert
{
    return nil;
}

//创建JSON（将键值转化为字典）
- (NSDictionary *)createJSON
{
    //获取类的所有属性
    NSDictionary *propertyDictionary = [NSDictionary dictionaryWithDictionary:[self dictionaryWithValuesForKeys:[self getPropertyList:[self class]]]];
    
    //去除空值
    NSMutableDictionary *JSON = [NSMutableDictionary dictionary];
    for (NSString *key in propertyDictionary) {
        if ([propertyDictionary[key] isKindOfClass:[NSNull class]]) {
            [JSON setObject:@"" forKey:key];
        } else {
            [JSON setObject:propertyDictionary[key] forKey:key];
        }
    }
    return JSON;
}

//调试模式
+ (void)debugMode:(BOOL)openOrNot
{
    DEBUG_MODE = openOrNot;
}

@end
