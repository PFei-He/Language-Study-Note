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

public class main<ARG1, ARG2, RET> {
    public static void main(String args[]) {
        main<Integer, Integer, Object> m = new main<Integer, Integer, Object>();
        System.out.println(m.add(8).add(10));
    }

    interface lambda1<ARG1, ARG2, RET> {
        RET add(ARG1 arg1, ARG2 arg2);
    }

    interface lambda2<ARG2, RET> {
        RET add(ARG2 arg);
    }

    lambda1<ARG1, ARG2, RET> functor() {
        return (lambda1<ARG1, ARG2, RET>) new lambda1<Integer, Integer, Integer>() {
            public Integer add(Integer x, Integer y) {
                return x + y;
            }
        };
    }

    lambda2<ARG2, RET> add(final ARG1 arg1) {
        return new lambda2<ARG2, RET>() {
            public RET add(ARG2 arg2) {
                return functor().add(arg1, arg2);
            }
        };
    }
}
