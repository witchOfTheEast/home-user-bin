#!/bin/perl
use strict;
use warnings;
use Data::Dumper;

my @text = ("AMM 50", "AMC 60");

my %last_count;

foreach (@text) {
    my @line = split /\s+/, $_;
    $last_count{$line[0]} = "$line[1]";
}
print "What is the last count of AMM?\n";
print $last_count{'AMM'};

