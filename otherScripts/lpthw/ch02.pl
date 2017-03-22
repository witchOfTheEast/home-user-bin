#!/usr/bin/perl

use strict;
use warnings;

=begin comment
my $filename = "/usr/share/dict/words";
open FILE, $filename or die "Can't $filename: $!";

# Basic string comparision
sub go_search {
    my $search_term = shift;
    print "I'm looking for $search_term\n";
    print "I'm looking in $filename\n";
    
    while (my $line = <FILE>) {
        if ($line =~ "$search_term") { # =~ "" matches a direct sequence
            print $line;
        }
        if ($line =~ m/pa..u.e/) { # =~ m// matches a regex
            print $line;
            }
        if ($line =~ m/^p...u.e$/) { # ^ anchors the start of a line
# $ anchors the end of a line
            print $line;
            }
        if ($line =~ m/ab{2}/) { # {} quantifies required # of times 
# quantifiers apply to atoms ab{2} is different than ab{2} 
# the latter requires abb
            print $line;
            }
        if ($line =~ m/(un)?usual/) { # atom may appear 0 or 1 times
            print $line;
            }
        if ($line =~ m/(un)+usual/) { # atom may appear 1 or more times
            print $line;
            }
        if ($line =~ m/(un)*usual/) { # atom may appear 0 or more times
            print $line;
        }
# m/a+/ and m/a*/ are nearly identical and infinite, but the latter
# also matches an empty string
# a pipe indicates atom OR atom ex: ^(un|in) matching any word beginning
# with in or un
# [] brackets indicate a character class. Ex: ^[abcde] any word beginning
# with one of a b c d or e
# ^[abcde]+$ matches words containingly only a-e
# ^[a-e][1-5] hyphens indicate a range
# ^[^0-9] a carrot inside a hyphen negates, so any NOT a digit
# \d digits
# \s whitespace
# \w word character
# 
}

go_search "obc";

=end comment
=cut

=begin comment
# Example of simple grep functionality
sub grep_file {
    my $pattern = shift;
    my $file = shift;
    open FILE, $file;

    while (my $line = <FILE>) {
        if ($line =~ m/$pattern/) {
            print $line
        }
    }
}

grep_file @ARGV;
=end comment
=cut

=begin comment
sub grep {
    print "Don't use core wordS";
}
grep; # this would be terribly confusing if we didn't know there is already
# a grep function in Perl
=end comment
=cut

=begin comment
# Capture with parethentical grouping
# Non-greedy syntax *? +? ??
my $ex_line = "http://www.gnu.org/philosophy/free-sw.html";
my $pattern = "(ftp|http)://(.*)/(.*)"; # provides grouping. Is GREEDY.
my $pattern_ng = "(ftp|http)://(.*?)/(.*)"; # provides grouping. Is NON-GREEDY.
if ($ex_line =~ m/$pattern/) {
    print "Protocol: $1\nMachine name: $2\nFile Name: $3\n";
}
if ($ex_line =~ m/$pattern_ng/) {
    print "Protocol: $1\nMachine name: $2\nFile Name: $3\n";
}
# \X like \1 \2 refers to prior captures in the same expression
# Extended patterns, m{PATTERN}x
if ($ex_line =~ m{
        (ftp|http)  # protocol
        ://
        (.*?)       # Machine name (non-greedy)
        /
        (.*)        # File name (greedy)
    }x # There are additional modifies available (not just 'x')
) { print "Protocol: $1\nMachine name: $2\nFile Name: $3\n" };
=end comment
=cut

# Operators
# Numerical comparision: > < == >= <= !=
# String comparision: gt lt eq ge le ne
# Perl will convert operands on the fly, thus in '10 lt 2' 10 and 2 are tested
# as strings

# Spaceship operator: <=>
# If left operand is larger, return 1
# If right operand is larger, return -1
# If left and right are equal, return 0

# Logical Operators: && || as AND and OR respectively
# Using die
open FILE, $file or die "Couldn't $file\n"; # does not equal the following
open FILE, $file || die "Couldn't $file\n"; # || has higher priority, which computers $file and the second clause never executes

# Using function call syntax (C like) would work, however
open(FILE, $file) || die "Couldn't $file\n";

# die special variables
# $0 contains the script name
# $! text description of most recent error
# Commonly used as sub croak { die "$0: @_: $!\n" };

my $word = "abarata";
if ( $word =~ m/(a)/ ) {
    print "Matched: $word\n";
}

