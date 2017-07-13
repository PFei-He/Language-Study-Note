#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

require 'b.pl'; #导入文件b
use c; #导入模块c

&say;
&c::say;
&c'say;
