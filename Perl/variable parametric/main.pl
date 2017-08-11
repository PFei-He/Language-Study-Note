#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub main {
    foreach my $value (@_) {
        print "$value\n";
    }
}

main('A', 'B', 'C');
