#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub add {
    my $x = shift;
    return sub { shift() + $x };
}

print add(8)->(10)."\n";
