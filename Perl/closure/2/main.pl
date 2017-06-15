#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

sub main {
    say(sub {
        print "Hello Perl!\n";
        my $end = shift;
        $end->("^_^");
    });
}

sub say {
    print "Hello World!\n";
    my $reply = shift;
    $reply->(sub {
        my $content = shift;
        print $content;
    });
}

main();
