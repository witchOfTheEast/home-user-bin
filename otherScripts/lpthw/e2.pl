#!/usr/bin/perl

use strict;
use warnings;

=begin comment # Exercise 2.1 # Write fgrep - take list of files and a single pattern. Search for the # pattern in all the files.  
sub grep_all_files {
    my $pattern = shift;
    while (my $filename = shift) {
        open FILE, $filename or die "Can't $filename: $!";
        
        while (my $line = <FILE>) {
            if ($line =~ m/$pattern/) {
                print "$filename: $line\n";
            }
        }
    }
}
grep_all_files @ARGV;
=end comment
=cut

=begin comment
# Exercise 2.2
# Match words starting with pre and ending with al

my $filename = "/usr/share/dict/words";
sub grep_me {
    my $pattern = shift; 
    open FILE, $filename or die "Can't $filename: $!";

    while (my $line = <FILE>) {
        if ($line =~ m/$pattern/) {
            print "$line\n";
        }
    }
}

# Exercise 2.3
# Match various
#grep_me "^pre.*al\$"; # beginning with pre and ending with al
#grep_me "^(a|b).*(a|b)\$"; # begin and end with a or b
#grep_me '^(a|b).*(a|b)$'; # begin and end with a or b
#grep_me '(^a.*a$|^b.*b$)'; # begin and end with a, or begin and end with b
#grep_me '^(a.*a|b.*b)$'; # begin and end with a, or begin and end with b
#grep_me '^(un|in).{15}$'; # begin with either un or in and only 17 characters
#grep_me '^(un|in)[a-z]{15}$'; # begin with either un or in and only 17 letters
#grep_me '^(un|in)[a-z]{16}[a-z]*$'; # begin with either un or in and more than 17 letters
=end comment
=cut

# Exercise 2.4
# Match lines that begin and end with the same character
my @some_lines = ("abba","caustic","always","sauce", "ooleo", "polecat", "potato");

my $pattern = '^(.).*(\g1)$'; # It's way easier to use single quotes around a pattern
# It's strongly recommended to use \g for backreferencing groups rather than \X

print "These are the lines\n";
foreach my $line (@some_lines) {
    print "$line\n";
}

print "Matching lines\n";
foreach my $line (@some_lines) {
    if ( $line =~ m/$pattern/ ) {
        print "$line\n"; 
    }

}
print "End\n";
