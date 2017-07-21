#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my @names = qw/ Find my want in array /;
my $result = &method("want", @names);
sub method {
    my($value, @array) = @_;
    foreach (0..$#array) { #数组 @array 中所有元素的下标
        if ($value eq $array[$_]) { # eq -> 字符串相等比较符, == -> 数字相等比较符
            return $_; #一发现就提前返回
        }
    }
    -1; #没找到符合条件的元素（return在这里可有可无）
}

print $result."\n";
