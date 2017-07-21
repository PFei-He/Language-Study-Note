#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub method {
#    (my $value) = @_; # (my $v1, my $2) = @_;
    my($value) = @_; # my($v1, $v2) = @_;
#    print "$value\n";
    print $value."\n";
}

#method;
&method("Hello!");
#do method;
