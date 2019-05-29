//
//  Copyright (c) 2019 faylib.top
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

#import <Foundation/Foundation.h>

@interface FLModel : NSObject

/*!
 创建 JSON
 @discussion
 Setter: 将字典的键值转化为数据模型的属性 (Dictionary -> Property)
 
 Getter: 将数据模型的属性转化为字典的键值 (Property -> Dictionary)
 @return 转化后的 JSON 数据
 */
@property (strong, nonatomic) id JSON;

/// XML数据
@property (strong, nonatomic) id XML;

/*!
 初始化
 @param JSON 需要解析的 JSON 数据
 @return MODEL 实例
 */
- (instancetype)initWithJSON:(id)JSON;

/*!
 初始化
 @param JSON 需要解析的 JSON 数据
 @return MODEL 实例
 */
+ (instancetype)modelWithJSON:(id)JSON;

/*!
 初始化
 @param XML 需要解析的 XML 数据
 @return MODEL 实例
 */
- (instancetype)initWithXML:(id)XML;

/*!
 初始化
 @param XML 需要解析的 XML 数据
 @return MODEL 实例
 */
+ (instancetype)modelWithXML:(id)XML;

/*!
 初始化
 @return MODEL 实例
 */
+ (instancetype)model;

/*!
 更换属性名
 @discussion 关于键值的转换
 
            需要换名的 JSON 数据的键(key) => 字典的键(key)
 
            接收数据的 MODEL 的属性(property) => 字典的值(value)
 @return 更换的属性列表
 */
- (NSDictionary *)propertyConvert;

/*!
 获取属性列表
 @return 属性列表数组
 */
- (NSArray *)propertyList;

/*!
 调试模式
 @param openOrNot 是否打开调试模式
 */
+ (void)debugMode:(BOOL)openOrNot;

@end
