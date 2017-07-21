#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my $filename = '../data.txt';
open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my $row = <$fh>;
print "$row\n";
print "done\n";
