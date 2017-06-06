#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub main {
    say(sub {
        my $content = shift;
        print $content;
        return "Hello Perl!\n";
    });
}

sub say {
    my $reply = shift;
    print $reply->("Hello World!\n");
}

main();
