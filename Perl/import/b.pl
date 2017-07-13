#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

push(@INC,'pwd'); #将当前目录加到路径寻找列表@INC中供寻找包时使用。pwd代表当前路径，也可改为此文件的绝对路径。

sub say {
    print "Hello Perl!\n"
}
