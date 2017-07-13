#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

my %hash = ('A' => '1', "B" => "2", C => "3");
print $hash{'A'}."\n";
print $hash{"B"}."\n";
print $hash{C}."\n";
