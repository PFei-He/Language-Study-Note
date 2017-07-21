#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub method {
    #    (my @value) = @_;
    my(@value) = @_;
    print "@value\n";
}

#method;
&method("Hello!");
#do method;
