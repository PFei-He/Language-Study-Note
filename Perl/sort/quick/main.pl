#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub quick_sort {
    return () unless @_;
    return (quick_sort(grep {$_ < $_[0]} @_[1..$#_]), $_[0], quick_sort(grep {$_ >= $_[0]} @_[1..$#_]));
}

my @array = (2, 1, 3, 5, 4);
print join(" ", quick_sort(@array));
