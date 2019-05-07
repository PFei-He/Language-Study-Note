/**
 * Copyright (c) 2019 faylib.top
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#[macro_export]
macro_rules! for_each {
    ($pat:pat in $iter:ident $code:block) => {
        loop {
            use std::iter::Iterator;
            let __for_each_item = Iterator::next(&mut $iter);
            if let Some($pat) = __for_each_item {
                $code
            } else {
                break;
            }
        }
    };
    ($item:ident in $iter:ident $code:block) => {
        loop {
            use std::iter::Iterator;
            let $item = Iterator::next(&mut $iter);
            if let Some($item) = $item {
                $code
            } else {
                break;
            }
        }
    };
}

fn main() {
    let mut array = 1..=2;
    for_each!(i in array {
        println!("{}", i);
    });
}
