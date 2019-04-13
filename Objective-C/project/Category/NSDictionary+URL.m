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

#import "NSDictionary+URL.h"

@implementation NSDictionary (URL)

// 转换为 URL 格式
- (NSString *)convertToURL
{
    NSArray * keys = [self allKeys];
    NSMutableString *mutableString = [NSMutableString string];
    for (int j = 0; j < keys.count; j++) {
        NSString *string;
        if (j == 0) {
            string = [NSString stringWithFormat:@"?%@=%@", keys[j], self[keys[j]]];
        } else {
            string = [NSString stringWithFormat:@"&%@=%@", keys[j], self[keys[j]]];
        }
        [mutableString appendString:string];
    }
    return mutableString;
}

// 作为参数拼接到 URL
- (NSString *)appendURLWithHost:(NSString *)host
{
    NSMutableString *URL = [NSMutableString stringWithFormat:@"%@", host];
    [URL appendString:[self convertToURL]];
    return URL;
}

@end
