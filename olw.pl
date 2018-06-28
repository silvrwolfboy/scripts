#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

use open qw(:std :utf8);
use autodie;
use DateTime;
use File::Temp 'tempfile';

# prompt for file inputs
sub prompt_file
{
    my $number;
    my $title;
    my $content;

    print "Article number: ";
    chomp($number = <STDIN>);

    if (!defined($number) || $number !~ /^[0-9]+$/)
    {
        die "Article number cannot be empty and it must be a whole number!\n";
    }

    print "Article title: ";
    chomp($title = <STDIN>);

    if (!defined($title) || length($title) < 3)
    {
        die "Article title cannot be less than 3 characters or empty!\n";
    }

    # use vim by default for advanced editing
    # in command line
    my ($fh, $tempfile) = tempfile;
    my $vim_proc = "vim " . $tempfile;
    system($vim_proc);

    open(my $file, '<', $tempfile);

    # load everything from tempfile into the
    # content variable
    {
        local $/;
        $content = <$fh>;
    }

    chomp($content);
    my %result = (
                  number  => $number,
                  title   => $title,
                  content => $content
                 );

    return \%result;
}

sub to_html
{
    my ($title, $content) = @_;

    my $written_time = DateTime->now->dmy;

    my $template = <<"    END_TEMPLATE";
<!DOCTYPE html>
<html lang="en"/>
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-with, initial-scale=1.0"/>
        
        <title>$title</title>
    </head>

    <body>
        <h1>faraco's Personal Site</h1>
        <p>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="https://twitter.com/_faraco"Twitter</a></li>
            <li><a href="https://gitlab.com/faraco-dev">Gitlab</a></li>
            <li><a href="https://github.com/faraco">Github</a></li>
        </ul>
        </p>

        <hr>

        <p style="text-align: center;">Made with love by <b>faraco</b></p>
        
        <hr>
        <h1>$title</h1>
        <h2>$written_time</h2>
        <p>$content</p>

        <hr>
    </body>
</html>
    END_TEMPLATE

    return $template;
}

sub write_to_file
{
    my $result = shift;

    my $number  = $result->{number};
    my $title   = $result->{title};
    my $content = $result->{content};

    # I want the file to be clean and
    # easy to find, so I remove all symbols
    # and replace all whitespaces with dash '-'.
    $title =~ tr/\'\"!\?@#$%^&*()-+[]{}|;:,\.\///d;
    $title =~ s/ /-/g;

    open(my $fh, '>', $number . "-$title.html");
    print($fh to_html($title, $content));

    say("$number-$title.html has been successfully created");

    return;
}

write_to_file(prompt_file);

