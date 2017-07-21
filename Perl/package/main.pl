#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

use package;

#package::say;

my $p = package::new;
$p->say;

#跑package的方法
#&package'say;

# Perl 4 & before
#package->method();
#package->method;
#package'method();
#package'method;
#&package'method();
#&package'method;

# Perl 5
#package::method();
#package::method;
#&package::method();
#&package::method;
