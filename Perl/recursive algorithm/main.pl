#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub main {
    recursive(0);
}

sub recursive {
    my $i = shift;
    if ($i >= 10) {
        return;
    } else {
        print "$i\n";
        $i++;
        recursive($i);
    }
}

main
