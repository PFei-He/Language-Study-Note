#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my $case_id = 0;
sub case {
    my $str = shift;
    $case_id++;
    print "$case_id: $str\n";
}

&case("a"); {
    print "behind case a\n";
}

&case("b"); {
    print "behind case b\n";
}
