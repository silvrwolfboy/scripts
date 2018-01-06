#!/usr/bin/perl

# Backup all of my github (faraco) public repositories.
use strict;
use warnings;

use JSON::MaybeXS 'decode_json';
use Pithub;
use v5.10;

my $repos = Pithub::Repos->new;
my $result = $repos->list(user => 'faraco');

# This node apparently is not converted to Perl data structure.
# So, we decode the node and make the git_url easily accessible.
my $decoded_json = decode_json $result->{response}{_content};

# Clone all of repo using git_url link.
foreach my $content_node (@{$decoded_json})
{
    system("git clone $content_node->{git_url}");
}

# Create faraco-github-backup.tar.gz and put every cloned repository directories inside it (including ghb.pl script itself).
system(
    'tar -czvf /tmp/faraco-github-backup.tar.gz .; mv /tmp/faraco-github-backup.tar.gz .'
);
