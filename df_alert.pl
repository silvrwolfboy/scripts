#!/usr/bin/perl

# Alert user if main file storage size exceeds 60%
use strict;
use warnings;
use v5.10;

my $df_output = `df -h | awk '/sda1/ {print \$5}'`;
$df_output =~ s/%$//;

say "Alert\nStorage usage is over @{[$df_output - 1]}%! Please remove unecessary junks from the operating system." if $df_output >= 60;

