#!/usr/bin/perl

# Backup all of my github (faraco) public repositories
# into $HOME/Dumps/ghb-backup-dir as faraco.tar.gz.
use strict;
use warnings;
use v5.10;

use JSON::MaybeXS 'decode_json';
use File::Path 'make_path';
use Pithub;

my $repos = Pithub::Repos->new;
my $result = $repos->list(user => 'faraco');

# This node apparently are not changed to Perl data structure.
# So, we decode the node and make the git_url easily accessible.
my $decoded_json = decode_json $result->{response}{_content};

foreach my $content_node (@{$decoded_json})
{
    system("git clone $content_node->{git_url}");

    # Pull new commits (if present) if the repository is already exist in
    # the local system.
    system("cd $content_node->{name}; git pull; cd ..;");
}

my $backup_archive_path = "$ENV{HOME}/Dumps/ghb-backup-ar";
make_path($backup_archive_path) if not -d $backup_archive_path;

# Create tar.gz and put every cloned repository directories inside it (including ghb.pl script itself).
system("tar -czvf /tmp/faraco-github-backup.tar.gz .; mv /tmp/faraco-github-backup.tar.gz $backup_archive_path");
