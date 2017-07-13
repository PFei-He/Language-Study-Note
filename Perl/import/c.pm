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
