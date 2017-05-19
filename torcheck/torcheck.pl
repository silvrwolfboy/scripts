#!/usr/bin/env perl

# Check if user connected through tor layer network (for torsocks user)
use warnings;
use LWP::Simple 'get';
use Mojo::DOM;
use v5.10;

my $dom = Mojo::DOM->new(get "https://check.torproject.org");

say $dom->at('title')->text;

say "Your IP is: " . $dom->at('strong')->text;
