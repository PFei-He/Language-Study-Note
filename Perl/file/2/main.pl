#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my $filename = '../data.txt';
if (open(my $fh, '<:encoding(UTF-8)', $filename)) {
    while (my $row = <$fh>) {
        chomp $row;
        print "$row\n";
    }
} else {
    warn "Could not open file '$filename' $!";
}
