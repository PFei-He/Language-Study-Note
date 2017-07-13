#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my @array = ('1', '2', '3');
my $str = shift @array;
print "$str\n";
print "@array\n";
