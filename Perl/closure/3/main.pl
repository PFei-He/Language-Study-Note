#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub main {
    say(sub {
        my $v = shift;
        print $v;
        return "Hello Perl!\n"
    });
}

sub say {
    my $v = shift;
    print $v->("Hello World!\n");
}

main();
