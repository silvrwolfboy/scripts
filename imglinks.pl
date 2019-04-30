#!/usr/bin/env perl

######################################################
# imglinks.pl                                        #
# Usage: perl imglinks.pl http://myurl.com           #
# Version: 0.1.0                                     #
#                                                    #
# Copyright (C) 2018 momozor (BSD-2-Clause)           #
#                                                    #
######################################################
use strict;
use warnings;
use v5.10;

use LWP::UserAgent;

my $ua = LWP::UserAgent->new;

# user agent spoof
# we use Mozilla browser v46.0 on windows as user agent
$ua->agent("Mozilla/5.0 (Windows NT 6.3; WOW64;"
           . "rv:46.0) Gecko/20100101 Firefox/46.0");

my $request = HTTP::Request->new(GET => shift);
my $response = $ua->request($request);
die "URL cannot be reached. Response Status: " . $response->code
    unless $response->code == 200;

my $content = $response->content;
die "No <img/> element found." if $content !~ m/<img\s+src=/;

my @lines = split(/\n/, $content);

foreach my $line (@lines) {

    # just get the links from img element
    if ($line =~ m/<img\s+src=/) {
        $line =~ s/<img\s+src=["']//;
        $line =~ s/["'].*//;
        $line =~ s/\s+//;

        say $line;
    }
}

