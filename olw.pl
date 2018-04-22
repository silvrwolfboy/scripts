use strict;
use warnings;
use autodie;
use v5.10;

print "What is your article number?: ";
my $number = <STDIN>;
die "Must be a number!" if $number !~ /[0-9]+/;
chomp $number;

print "Write your post/article title: ";
my $title = <STDIN>;
chomp $title;

my $title_in_article = ucfirst $title;

print "Write your article content: ";
my $content = <STDIN>;
chomp $content;

my $html_template = <<"END_TEMPLATE";
<!DOCTYPE html>
<html lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>$title_in_article</title>

    <h1>faraco's personal site</h1>
    <p>
    <ul>
        <li><a href="https://twitter.com/_faraco">faraco's Twitter</a></li>
        <li><a href="https://github.com/faraco">faraco's Github</a></li>
    </ul>
    </p>
    
    <hr>
    
    <h1>$title_in_article</h1>
    <p>$content</p>
    
    <hr>
    <footer>
    <p style="text-align: centered">Made with simplicity in mind by <b>faraco</b></p>
</html>
END_TEMPLATE

$title =~ tr/\'\"!@#$%^&*()-+[]{}|;:,.\///d;
$title =~ s/ /-/g;

my $title_for_file = lc $title;

open(my $fh, ">", $number . "-$title_for_file.html");
print $fh $html_template;
close $fh;
