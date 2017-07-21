#!/usr/bin/perl

#$ perl main.pl


use strict;
use warnings FATAL => 'all';


# @array ==> array type
# $str ==> string type


#pop
my @pop = ('a', 'b', 'c');
my $pop = pop @pop;
print "pop: $pop\n";
print "pop: @pop\n";


#push
my @push = ('a', 'b');
push @push, 'c';
print "push: @push\n";


#shift
my @shift = ('a', 'b', 'c');
my $shift = shift @shift;
print "shift: $shift\n";
print "shift: @shift\n";


#unshift
my @unshift = ('b', 'c');
unshift @unshift, 'a';
print "unshift: @unshift\n";
