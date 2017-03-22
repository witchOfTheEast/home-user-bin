#!/usr/bin/perl

# Goal: Take directory name and prints files therein, one per line
use strict;
use warnings;

sub pprint {
    print "@_\n";
}
=begin comment
=pod
# Exercise 1.1
sub print_dir {
    foreach (@_) {
        print "$_\n";
    }
}

sub get_files {
    foreach (@_) {
        my $dir = $_;
        print $dir; # check
        my @file_list = glob "$dir/*";
        print_dir @file_list;
    }
}

get_files @ARGV

=cut
=pod
# Exercise 1.1, improved logic 
sub get_files {
    foreach my $dir (@_) {
        my @file_list = glob "$dir/*";
        return @file_list;
    }
}

sub print_dir {
    foreach my $dir (@_) {
        my @alist = get_files $dir;
        print ( join "\n", @alist); # Why does this print all on one line?
        foreach (@alist) {
            print "$_\n";
        }
    }
}

print_dir @ARGV
=cut

=pod

# Exercise 1.2, print files instead of directory contents
# get_files() is a repeat of above
sub get_files {
    foreach my $dir (@_) {
        my @file_list = glob "$dir/*";
        return @file_list;
    }
}

sub print_contents {
    foreach my $dir (@_) {
        my @file_list = get_files $dir;
    
        foreach my $filename (@file_list) {
            open my $file, $filename or die "Can't file: $!";
            print "********************\n";
            print "$filename\n\n";
            my $i = 0;
            while ( (my $line = <$file>) && ($i <= 1) ) {
                print "$line\n";
                $i++;
            }
        }
    }
}

print_contents @ARGV;
=end comment
=cut

# Exercise 1.3, call print_dir on directories, print_contents on files

sub get_sub {
    foreach my $dir (@_) {
        my @sub_list = glob "$dir/*";
        return @sub_list;
    }
}

sub test_dir {
    foreach my$value (@_) {
        #print "**TESTING** $value\n";

        if ( ! -d $value ) {
            print "NOT DIRECTORY -- \t$value\n";
            return;
        }
        else { 
            my @sub_list = get_sub $value;
            #print "@sub_list\n"; 
            print "    DIRECTORY -- \t$value\n";
            test_dir(@sub_list); # this format was important to get the
            # recursive aspect to not error
        }
    }
    
}
test_dir @ARGV;
