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

#import "NSObject+FLURL.h"

@implementation NSObject (FLURL)

// 序列化参数
- (NSString *)serializeParameters:(NSDictionary *)parameters
{
    NSMutableArray *pairs = NSMutableArray.array;
    for (NSString *key in parameters.keyEnumerator) {
        id value = parameters[key];
        if ([value isKindOfClass:[NSDictionary class]]) {
            for (NSString *subKey in value) {
                [pairs addObject:[NSString stringWithFormat:@"%@[%@]=%@", key, subKey, [self queryStringForURLParameter:[value objectForKey:subKey]]]];
            }
        } else if ([value isKindOfClass:[NSArray class]]) {
            for (NSString *subValue in value) {
                [pairs addObject:[NSString stringWithFormat:@"%@[]=%@", key, [self queryStringForURLParameter:subValue]]];
            }
        } else {
            [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, [self queryStringForURLParameter:[NSString stringWithFormat:@"%@", value]]]];
        }
    }
    return [pairs componentsJoinedByString:@"&"];
}

// 将参数转为 URL 字符串格式
- (NSString *)queryStringForURLParameter:(NSString *)parameter
{
    return [parameter stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

@end
