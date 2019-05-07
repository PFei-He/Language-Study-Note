#
# Copyright (c) 2019 faylib.top
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
use strict;
use warnings FATAL => 'all';

sub main {
    my @array = (2, 1, 3, 5, 4);
    print join(" ", bubble_sort(@array))."\n";
}

sub swap {
    @_[ 0, 1 ] = @_[ 1, 0 ];
}

sub bubble_sort {
    my (@array) = @_;
    for my $i (0 .. $#array) {
        for my $j (0 .. $#array - 1 - $i) {
            swap $array[$j], $array[$j + 1]
                if $array[$j] > $array[$j + 1];
        }
    }
    return @array;
}

main();
