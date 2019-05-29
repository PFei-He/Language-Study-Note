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

#import "FLKeychainWrapper.h"

@implementation FLKeychainWrapper

#pragma mark - Private Methods

// 操作钥匙串
- (NSMutableDictionary *)keychainQueryWithService:(NSString *)service account:(NSString *)account accessGroup:(NSString *)accessGroup
{
    NSMutableDictionary *query = [NSMutableDictionary dictionary];
    query[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
    query[(__bridge id)kSecAttrService] = service;
    query[(__bridge id)kSecAttrAccount] = account;
    query[(__bridge id)kSecAttrAccessGroup] = accessGroup;
    
    return query;
}

#pragma mark - Pubilc Methods

// 存储/更改账号密码到钥匙串
- (void)setPassword:(NSString *)password forAccount:(NSString *)account
{
    NSData *passwordData = [password dataUsingEncoding:NSUTF8StringEncoding];
    NSString *oldPassword = [self passwordForAccount:account];
    if (oldPassword.length > 0) {
        NSMutableDictionary *updateAttributes = [NSMutableDictionary dictionary];
        updateAttributes[(__bridge id)kSecValueData] = passwordData;
        NSMutableDictionary *query = [self keychainQueryWithService:self.service account:account accessGroup:self.accessGroup];
        OSStatus statusCode = SecItemUpdate((__bridge CFDictionaryRef)query, (__bridge CFDictionaryRef)updateAttributes);
        NSAssert(statusCode == noErr, @"Couldn't update the Keychain Item.");
    } else {
        NSMutableDictionary *attributes = [self keychainQueryWithService:self.service account:account accessGroup:self.accessGroup];
        attributes[(__bridge id)kSecValueData] = passwordData;
        OSStatus status = SecItemAdd((__bridge CFDictionaryRef)attributes, nil);
        NSAssert(status == noErr, @"Couldn't add the Keychain Item.");
    }
}

// 查找账号密码
- (NSString *)passwordForAccount:(NSString *)account
{
    NSMutableDictionary *attributes = [self keychainQueryWithService:self.service account:account accessGroup:self.accessGroup];
    attributes[(__bridge id)kSecMatchLimit] = (__bridge id)(kSecMatchLimitOne);
    attributes[(__bridge id)kSecReturnAttributes] = (__bridge id _Nullable)(kCFBooleanTrue);
    attributes[(__bridge id)kSecReturnData] = (__bridge id _Nullable)(kCFBooleanTrue);

    CFMutableDictionaryRef queryResult = nil;
    OSStatus keychainError = noErr;
    keychainError = SecItemCopyMatching((__bridge CFDictionaryRef)attributes, (CFTypeRef *)&queryResult);
    if (keychainError == errSecItemNotFound) {
        if (queryResult) CFRelease(queryResult);
        return nil;
    } else if (keychainError == noErr) {
        if (queryResult == nil) {
            return nil;
        }
        NSMutableDictionary *resultDict = (__bridge NSMutableDictionary *)queryResult;
        NSData *passwordData = resultDict[(__bridge id)kSecValueData];
        NSString *password = [[NSString alloc] initWithData:passwordData encoding:NSUTF8StringEncoding];
        
        return password;
    } else {
        NSAssert(NO, @"Serious error.\n");
        if (queryResult) CFRelease(queryResult);
    }
    return nil;
}

// 删除账号密码
- (BOOL)deletePasswordForAccount:(NSString *)account
{
    NSMutableDictionary *query = [self keychainQueryWithService:self.service account:account accessGroup:self.accessGroup];
    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)query);
    if (status != noErr && status != errSecItemNotFound) {
        return NO;
    }
    return true;
}

@end
