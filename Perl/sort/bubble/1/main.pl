#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub main {
    my @array = (2, 1, 3, 5, 4);
    print join(" ", bubble_sort(@array))."\n";
}

sub bubble_sort {
    my (@array) = @_;
    for my $i ( 0 .. $#array ) {
        for my $j ( 0 .. $#array - 1 - $i ) {
            swap($array[$j], $array[$j + 1])
                if $array[$j] > $array[$j + 1];
        }
    }
    return @array;
}

sub swap {
    @_[ 0, 1 ] = @_[ 1, 0 ];
}

main();
