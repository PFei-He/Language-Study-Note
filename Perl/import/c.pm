#
# Copyright (c) 2019 faylib.top
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

package c;
use strict;
use warnings FATAL => 'all';

push(@INC,'pwd'); #将当前目录加到路径寻找列表@INC中供寻找包时使用。pwd代表当前路径，也可改为此文件的绝对路径。

sub say {
    print "Hello Perl!\n"
}

#一个模块就是一个包，一个包就是一个类。在做其它事之前，先加入“1;”这样一行，当增加其它行时，记住保留“1;”为最后一行。这是Perl包的必需条件，否则该包就不会被Perl处理
#等同于“return 1;”，return可以省略。
1;
