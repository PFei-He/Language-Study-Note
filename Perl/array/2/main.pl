#
# Copyright (c) 2018 faylib.top
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

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
