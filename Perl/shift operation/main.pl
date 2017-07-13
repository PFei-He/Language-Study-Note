#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my $num = 8;
$num = $num >> 2; # 8/2^2  8除以2的2次方
print $num."\n";
