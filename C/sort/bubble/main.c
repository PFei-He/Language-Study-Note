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

#include <stdio.h>

int main(int argc, const char * argv[]) {
    char array[] = {'B', 'A', 'E', 'C', 'D'};
    for(int i = 0; i < sizeof(array)/sizeof(array[0]); i++) {
        printf("%c ", array[i]);
    }
    printf("\n");
    for(int i = 0; i < sizeof(array)/sizeof(array[0]); i++) {
        for(int j = 0; j < sizeof(array)/sizeof(array[0]); j++) {
            if (array[i] < array[j]) {
                char temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
    for(int i = 0; i < sizeof(array)/sizeof(array[0]); i++) {
        printf("%c ", array[i]);
    }
    printf("\n");
    return 0;
}
