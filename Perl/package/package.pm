package package;
use strict;
use warnings FATAL => 'all';

sub new {
    my $class = shift @_ || __PACKAGE__;
    my $self = {};

    return bless $self, $class;
}

sub say {
    print "Hello World!\n";
}

1;
