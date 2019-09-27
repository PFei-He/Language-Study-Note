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

#import "FLCryptor.h"
#import "RNEncryptor.h"
#import "RNDecryptor.h"
#import <CommonCrypto/CommonDigest.h>

@implementation FLCryptor

static NSArray * encryptPasswords = nil;

#pragma mark - Private Methdos

// 解密文件
+ (NSData *)decryptAES256:(NSString *)string decryptedData:(NSData *)decryptedData count:(NSInteger)i
{
    NSData *base64Data;
    NSString *decryptedString;
    NSError *error;
    
    if (i < 1) return decryptedData;
    
    if (!string) string = @"";
    
    base64Data = [[NSData alloc] initWithBase64EncodedString:string options:0];
    decryptedData = [RNDecryptor decryptData:base64Data withPassword:encryptPasswords[encryptPasswords.count - i] error:&error];
    decryptedString = [decryptedData base64EncodedStringWithOptions:0];
    i--;
    
    return [FLCryptor decryptAES256:decryptedString decryptedData:decryptedData count:i];
}

// 加密文件
+ (NSString *)encryptAES256:(NSData *)data base64String:(NSString *)base64String count:(NSInteger)i
{
    NSData *base64Data;
    NSError *error;
    if (i < 1) return base64String;
        
    i--;
    NSData *encryptedData = [RNEncryptor encryptData:data withSettings:kRNCryptorAES256Settings password:encryptPasswords[i] error:&error];
    base64String = [encryptedData base64EncodedStringWithOptions:0];
    base64Data = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
        
    return [FLCryptor encryptAES256:base64Data base64String:base64String count:i];
}

#pragma mark - Public Methods

// 设置密码
+ (void)AES256Passwords:(NSArray<NSString *> *)passwords
{
    encryptPasswords = passwords;
}

// 解密
+ (NSData *)decryptAES256:(NSString *)string
{
    return [FLCryptor decryptAES256:string decryptedData:nil count:encryptPasswords.count];
}

// 加密
+ (NSString *)encryptAES256:(NSData *)data
{
    return [FLCryptor encryptAES256:data base64String:nil count:encryptPasswords.count];
}

// 加密
+ (NSString *)encryptMD5:(NSString *)string
{
    const char* input = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *md5String = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [md5String appendFormat:@"%02x", result[i]];
    }
    
    return md5String;
}

@end
