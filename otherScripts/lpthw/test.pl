#!/usr/bin/perl
#
#
use strict;
use warnings;

my $count = 0;
print $count;

while ( $count < 3 ) {
    print "Potato";
    $count++;
}

my @list = ("one","two","three","four","5","six");
my @short = @list[0, 2];
print "\n";
print "@short\n";
