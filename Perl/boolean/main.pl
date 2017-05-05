#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';


use constant false => 0;
use constant true => 1;

sub compare {
    my($v1, $v2) = @_;
    if ($v1 eq $v2) {
        return true;
    } else {
        return false;
    }
}

my $num1 = 2;
my $num2 = 3;
print(&compare($num1, $num2));
