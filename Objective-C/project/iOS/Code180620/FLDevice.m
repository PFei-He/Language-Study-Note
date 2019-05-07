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

#import "FLDevice.h"

///调试模式
static BOOL DEBUG_MODE = NO;

@implementation FLDevice

+ (NSString *)systemVersion
{
    if (DEBUG_MODE) {
        NSLog(@"[ DEVICE ][ DEBUG ] System version.");
        NSLog(@"[ -> ][ INFO ] %@", [UIDevice currentDevice].systemVersion);
    }
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)appVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    if (DEBUG_MODE) {
        NSLog(@"[ DEVICE ][ DEBUG ] App version.");
        NSLog(@"[ -> ][ INFO ] %@", [infoDictionary objectForKey:@"CFBundleShortVersionString"]);
    }
    return infoDictionary[@"CFBundleShortVersionString"];
}

+ (NSString *)appBuildVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    if (DEBUG_MODE) {
        NSLog(@"[ DEVICE ][ DEBUG ] App build version.");
        NSLog(@"[ -> ][ INFO ] %@", [infoDictionary objectForKey:@"CFBundleVersion"]);
    }
    return infoDictionary[@"CFBundleVersion"];
}

+ (BOOL)updateDetection:(NSString *)serverVersion
{
    NSArray *server = [serverVersion componentsSeparatedByString:@"."];
    NSArray *local = [[FLDevice appVersion] componentsSeparatedByString:@"."];
    for (int i = 0; i < server.count; i++) {
        if (i > (local.count - 1)) {
            return YES;
        } else if ([server[i] intValue] > [local[i] intValue]) {
            return YES;
        } else if ([server[i] intValue] < [local[i] intValue]) {
            return NO;
        }
    }
    return NO;
}

+ (BOOL)isJailbroken
{
#if !(TARGET_IPHONE_SIMULATOR)

    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/bin/bash"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/sshd"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"] ||
        [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]]) {
        return YES;
    }

    FILE *f = NULL;
    if ((f = fopen("/bin/bash", "r")) ||
        (f = fopen("/Applications/Cydia.app", "r")) ||
        (f = fopen("/Library/MobileSubstrate/MobileSubstrate.dylib", "r")) ||
        (f = fopen("/usr/sbin/sshd", "r")) ||
        (f = fopen("/etc/apt", "r"))) {
        fclose(f);
        return YES;
    }
    fclose(f);

    NSError *error;
    NSString *stringToBeWritten = @"This is a test.";
    [stringToBeWritten writeToFile:@"/private/jailbreak.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
    [[NSFileManager defaultManager] removeItemAtPath:@"/private/jailbreak.txt" error:nil];

    if(error == nil) {
        return YES;
    }

#endif

    return NO;
}

+ (void)debugMode:(BOOL)openOrNot
{
    DEBUG_MODE = openOrNot;
}

@end
