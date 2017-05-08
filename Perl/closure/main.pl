#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';


sub add {
    my $x = shift;
    return sub { shift() + $x };
}

my $addx = add(8);

print $addx->(10)."\n";
