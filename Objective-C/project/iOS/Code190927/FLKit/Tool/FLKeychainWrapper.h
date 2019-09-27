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
#import <Security/Security.h>

@interface FLKeychainWrapper : NSObject

/*!
 
 */
@property (nonatomic, copy) NSString *service;

/*!
 
 */
@property (nonatomic, copy) NSString *accessGroup;

/*!
 存储/更改键值
 
 @discussion 将键值添加到钥匙串中
 
 @param value 存到钥匙串中的值
 
 @param key 存到钥匙串中的键
 */
- (void)setValue:(NSString *)value forKey:(NSString *)key;

/*!
 查找键值
 
 @discussion 取出钥匙串中的键值
 
 @param key 存到钥匙串中的键
 
 @return 返回钥匙串中的值
 */
- (NSString *)valueForKey:(NSString *)key;

/*!
 删除键值
 
 @discussion 将钥匙串中的键值移除
 
 @param key 键
 
 @return 删除是否成功
 */
- (BOOL)deleteValueForKey:(NSString *)key;

@end
