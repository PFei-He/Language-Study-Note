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

// 存储/更改键值
- (void)setValue:(NSString *)value forKey:(NSString *)key
{
    NSData *data = [value dataUsingEncoding:NSUTF8StringEncoding];
    if ([self valueForKey:key].length > 0) {
        NSMutableDictionary *updateAttributes = [NSMutableDictionary dictionary];
        updateAttributes[(__bridge id)kSecValueData] = data;
        NSMutableDictionary *query = [self keychainQueryWithService:self.service account:key accessGroup:self.accessGroup];
        /*OSStatus statusCode = */SecItemUpdate((__bridge CFDictionaryRef)query, (__bridge CFDictionaryRef)updateAttributes);
//        NSAssert(statusCode == noErr, @"Couldn't update the Keychain Item.");
    } else {
        NSMutableDictionary *attributes = [self keychainQueryWithService:self.service account:key accessGroup:self.accessGroup];
        attributes[(__bridge id)kSecValueData] = data;
        /*OSStatus status = */SecItemAdd((__bridge CFDictionaryRef)attributes, nil);
//        NSAssert(status == noErr, @"Couldn't add the Keychain Item.");
    }
}

// 查找键值
- (NSString *)valueForKey:(NSString *)key
{
    NSMutableDictionary *attributes = [self keychainQueryWithService:self.service account:key accessGroup:self.accessGroup];
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
        NSMutableDictionary *dictionary = (__bridge NSMutableDictionary *)queryResult;
        NSData *data = dictionary[(__bridge id)kSecValueData];
        NSString *value = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return value;
    } else {
//        NSAssert(NO, @"Serious error.\n");
        if (queryResult) CFRelease(queryResult);
    }
    return nil;
}

// 删除键值
- (BOOL)deleteValueForKey:(NSString *)key
{
    NSMutableDictionary *query = [self keychainQueryWithService:self.service account:key accessGroup:self.accessGroup];
    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)query);
    if (status != noErr && status != errSecItemNotFound) {
        return NO;
    }
    return true;
}

@end
