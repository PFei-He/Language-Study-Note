#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

#my @array = qw(1 2);
my @array = ('1', '2');
print "@array\n";
foreach my $i (@array) {
    print "$i\n";
}
