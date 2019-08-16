//
//  main.m
//  demo2
//
//  Created by Mac on 2019/8/10.
//  Copyright © 2019 FayLib. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "version.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [version compareWithClientVersion:@"2.1.3b" serverVersion:@"2.1.15a"]);
    }
    return 0;
}
