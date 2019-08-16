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
use 5.010;

sub filling {
    my @array = ("0000", "000", "00", "0", "");
    my @strings = split(/\./, shift);
    foreach my $i (0 .. $#strings) {
        my $index = length($strings[$i]);
        $strings[$i] = $array[$index].$strings[$i];
    }
    return join("", @strings);
}

sub compare {
    my $client = filling(shift);
    my $server = filling(shift);

    if ($client gt $server) {
        return $client;
    }

    if ($client lt $server) {
        return $server;
    }
}

sub main {
    say compare("2.1.3b", "2.1.15a");
}

main;
