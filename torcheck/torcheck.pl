#!/usr/bin/env perl

use warnings;
use LWP::Simple 'get';
use Mojo::DOM;
use v5.10;

my $dom = Mojo::DOM->new(get "https://check.torproject.org");

say $dom->at('title')->text;

say "Your IP is: " . $dom->at('strong')->text;
