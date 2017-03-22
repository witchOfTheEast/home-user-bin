#!/usr/bin/perl
use strict;
use warnings;

# Stack operators
# Push - adds to end of array
# Pop - removes and returns last element

=being comment
print "Demo of push and pop\n";
my @list = (1, 2);
print "List at start\n@list\n";
push @list, 3;
print "List after push 3\n@list\n";
my $element = pop @list;
print "List after pop \@list\n@list\n";
=end comment
=cut

=begin comment
print "\nStack to reverse stack example\n";
sub rev {
    foreach (@_) { push @stack, $_; } # add each element of the parameter to @stack
    my @list;
    while ( my $element = pop @stack ) { # while there are elements of @stack, pop them to $element
            print "$element\n";
            push @list, $element; # push $element to @list
        }
    return @list;
}
my @list_to_reverse = ("apple", "banana", "cucumber");
print "List before rev\n@list_to_reverse\n";
my @reversed_list = rev @list_to_reverse;
print "Reversed list\n@reversed_list\n";
=end comment
=cut

=begin comment
sub rev3 {
    for ( my $i = 0; $i < @_/2; $i++ ) {
        swap ($_[$i], $_[-$i-1]);
    }
    return @_;
}
=end comment
=cut

# Queue operators
# shift - removes and returns first element
# unshift - adds element to first

=begin comment
# Hashes
# identified by %
# % will assume keys are strings in context
my %hash;
$hash{do} = "a deer";
$hash{re} = "a sun";
$hash{mi} = "myself";

# keys operator returns list of keys
print keys %hash;
print "\n";

# better
foreach my $key (keys %hash) {
    print "$key => $hash{$key}\n";
}

# double arrows => can assign key=>values
my %hash2 = (
    do => "deer",
    re => "sun",
    mi => "myself",
);

# each traversal
# each returns the key-value as a two element list

while ( ( my $key, my $value ) = each %hash ) {
    print "$key => $value\n";
}

# values
# traverse the values
my @other_values = values %hash;
print "@other_values\n";
foreach (@other_values) {
    print "$_\n";
}

=end comment
=cut
# sort hashes
# sorts by string comparison by default
our %hash = (
    dollar => 100,
    cent => 1,
    dime => 10,
    nickel => 5,
    quarter => 25,
);

sub print_hash {
    my @list = sort keys %hash;
    print "@list\n";
    foreach my $key (@list) {
        print "$key => $hash{$key}\n";
    }
}
print_hash;

# sorting by a different order
# by creating a sorting subroutine
# the spaceship <=> returns 1 if the first is greater, -1 if the second, and zero if equal

# numerical sort
sub numerical { $a <=> $b };
sub print_hash_by_num {
    my @list = sort numerical values %hash;
    print "@list\n";
}
print_hash_by_num;

sub byValue {
    our %hash;
    $hash{$b} <=> $hash{$a};
}

sub print_hash_by_val {
    my @list = sort byValue keys %hash;
    print "@list\n";
}
print_hash_by_val;
