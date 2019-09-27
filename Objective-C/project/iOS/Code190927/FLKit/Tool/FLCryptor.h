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

NS_ASSUME_NONNULL_BEGIN

@interface FLCryptor : NSObject

/*!
 设置密码
 
 @param passwords 密码数组
 
 @discussion 设置 AES256 加密时使用的密钥，加密的次数为数组的个数
 */
+ (void)AES256Passwords:(NSArray<NSString *> *)passwords;

/*!
 解密
 
 @discussion 使用 AES256 的加密方式对数据进行解密
 
 @param string 需要解密的内容，传入 Base64 编码的字符串
 
 @return 解密成功的数据
 */
+ (NSData *)decryptAES256:(NSString *)string;

/*!
 加密
 
 @discussion 使用 AES256 的加密方式对数据进行加密
 
 @param data 需要加密的内容，传入 Base64 编码的数据
 
 @return 加密成功的数据
 */
+ (NSString *)encryptAES256:(NSData *)data;

/*!
 加密
 
 @discussion 使用 MD5 的加密方式对数据进行加密
 
 @param string 需要加密的内容
 
 @return 加密成功的数据
 */
+ (NSString *)encryptMD5:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
