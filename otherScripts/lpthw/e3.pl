#!/usr/bin/perl

use strict;
use warnings;

=begin comment
# Exercise 3.1
# Modify rev to work like the built-in reverse i.e. operating on the parameter
# list directly

# This works but doesn't act on the parameter list
my @start_list = ("apple", "banana", "cucumber");
sub rev_improved {
    my @list;
    while (my $element = pop (@_) ) {
        push @list, $element;
    }
    return @list;
}

print "Start: @start_list\n";
my @rev_list = rev_improved @start_list;
print "End: @rev_list\n";
=end comment
=cut

=begin comment
# This doesn't work as desired because it's taking the first, not last element
my @start_list = ("apple", "banana", "cucumber");
sub rev_improved2 {
    my @list;
    foreach (@_) {
        push @list, $_;
    }
    return @list;
}

print "Start: @start_list\n";
my @rev_list = rev_improved2 @start_list;
print "End: @rev_list\n";

=end comment
=cut

=begin comment
# This doesn't work either
my @start_list = ("apple", "banana", "cucumber");
sub rev_improved3 {
    print "Para at start: @_\n";
    my $length = @_;
    print "Length: $length\n";
    my $count = 0;
    my $element;
    while ( $count < 3 ) {
        print "Count is at: $count\n";
        $element = pop (@_);
        print "Element: $element\n";
        print "Now para: @_\n";
        push @_, $element;
        $count++; 
    }
    return @_;
}

print "Start: @start_list\n";
my @rev_list = rev_improved3 @start_list;
print "End: @rev_list\n";

=end comment
=cut

# Exercise 3.2
# Frequency Counter
sub croak { die "$0: @_: $!\n" };


sub read_line {
    our %hash;
    # split on anything NOT a-z or an apostrophe. Note: Will also skip single
    # quotes. lc operator pass only lowercase values from shift 
    my @list = split /[^a-z|']/, lc shift;
   
    # create hash of word => number pairs, incrementing each time a word is found
    foreach my $word (@list) {
        $hash{$word}++;
    }
}

sub read_file {
    my $file = shift;
    open (FILE, $file) || croak "Couldn't open $file";

    while (my $line = <FILE>) {
        read_line $line;
    }
}
sub print_keys {
    our %hash;
    my @list = keys %hash;
    print "\nThe keys are\n\n";
    for my $key (@list) {
        print "$key\n";
    }
}

sub get_value{
    our %hash;
    my $target = shift;
    return $hash{$target};
}

sub print_key_value {
    while ((my $key, my $value) = each our %hash) {
        print "$key - $value\n";
    }
}

sub get_unique {
    my @list;
    while ( (my $key, my $value) = each our %hash) {
        if ( $value == 1 ) {
            push @list, $key;
        }
    }
    print "\nUnique words:\n\n";
    foreach my $key (@list) {
        my $value = get_value($key);
        print "$key: $value\n";
    }
}

sub sort_a_hash {
    our %hash;
    my @sorted_list = sort { $hash{$b} <=> $hash{$a} } keys %hash;
    print "SORTED: @sorted_list\n";
}

sub sort_by_value {
    our %hash;
    $hash{$b} <=> $hash{$a};
}

sub get_top_twenty {
    my @list = sort sort_by_value keys our %hash;
    my @top_twenty = @list[0 .. 5];
    print "\n@top_twenty\n";
    ### DERP
    #foreach my $key (@top_twenty) {
        while ((my $key, my $value) = each our %hash) {
            print "$key => $value\n";
        }
    }
}

my $file_name = "ex3_source";
read_file $file_name;
#print_keys();
#print_key_value();
#get_unique();
#sort_a_hash();
get_top_twenty;
