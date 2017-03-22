#!/usr/bin/perl

use strict; # this ''pragma'' assists catching otherwise overlookd errors
use warnings; # this ''pragma'' assists catching poorly written code
#print "@ARGV\n"; # basic print, @ARGV is a built-in array containing cli args

#prin "@ARGV\n"; # generates compile-time error

#print "@ARG\n"; # generates symantic error. silently, if not use strict; 

=begin comment

#Example: subroutine (function?) to wrap the entire script itself and call it
sub ch1 { # name could be anything
    print "@_\n"; # @_ refernces parameters passed to subroutine
}
ch1 @ARGV # if this isn't the last line of the script no ; erros at compile-time

=end comment # this comment format keeps it out of perldoc
# also =end comment is not strictly necessary as =cut returns to normal code
=cut 

=begin comment

# Example: local variables
sub arrays { 
    my @params = @_; 
        # ''my'' specifies a local variable
        #@params = @_; # use strict; will complain as this tries to create a global

    print "@params\n"; 
    print "$params[0] $params[2]\n"; 
        # Arrays are zero indexed

    my $word = $params[0]; 
        # $ indicates scalar values

    my $word = @params[0]; # use warnings; will try to catch this
        # This is wrong, for two reasons. 1 $word masks the previous value.
        # 2 @params[0] is a scalar, not an array

    my @words = @params[0, 1]; # slice
    print "@words\n";
        # All that being said, context may alter use of $ and @

    my $word = @params; 
        # arrays evaluated in scalar context yield # of elements
    print "$word\n"; 
        # $" = "\n"; # $" and $, are list and output separators
        # they are global. Best practice *NOT* to redefine them, even local
    print ( join "\n", @params); # instead use join
}
arrays @ARGV;
    
=end comment
=cut

=begin comment

sub list_literals {
        # standard list example
    my @list = (1, 2, 3);
    print "@list\n";
    
        # an example of when a list act different than an array
    my $scalar = (4, 5, 6); 
        # list in scalar context, triggers use warnings;
    print "$scalar\n"; 
        # prints last value, I think because each list value
        # is assigned in order, clobbering the one before

        # traditional list
    my @list2 = (7, 8, 9);
    my $scalar = @list2;
    print "$scalar\n"; # prints length of list
    
}
list_literals;

=end comment
=cut

=begin comment

sub list_assign {
    my ($p1, $p2, @params) = @_; 
        # assigns in order 1:1 scalar and all remaining
        # to the array
    print "$p1 $p2 @params\n";
}
list_assign @ARGV;

=end comment
=cut

=pod # this also creates comment blocks, but will appear in perldoc

sub shift_op {
        # many operators have a side effect and return a value
    my $p1 = shift @_; 
        # shift removes first value (side effect) and returns it
        # (return value)
    my $p2 = shift @_; 
    print "$p1 $p2 leftovers: @_\n"; 
        # Note: the @_ array has been changed
        # Note: shift w/o an arg will assume the arg @_ as in shift r@_;
}
shift_op @ARGV;

=cut

=pod

sub file_handling {
    open SOMEFILEHANDLENAME, "/usr/share/dict/words" or die "Can't 'SOMEFILEHANDLENAME': $!";
    # SOMEFILEHANDLENAME is global. Uppercase is merely convention
    open my $otherFileHandleName, "/usr/share/dict/words"; 
    # otherFileHandleName is local
    my $first = <SOMEFILEHANDLENAME>;
    my $otherFirst = <$otherFileHandleName>;

    # common read file loop
    #while (my $line = <SOMEFILEHANDLENAME>) {
    #    print $line;
    #}
    # The end of a file returns ''undef'' which is a ''False'' to while loops
}
file_handling;

=cut

=pod
# a basic implementation of UNIX cat behavior

sub print_file {
    my $file = shift; # automatically assums shift @_;
    open FILE, $file;
    while (my $line = <FILE>) {
        print $line;
    }
}

sub fake_cat {
    while (my $file = shift) { # $file is locally defined, no conflict above
        print_file $file;
    }
}
fake_cat @ARGV;
=cut

=pod
sub for_interation {
    # alternative to the fake_cat while iteration
    foreach my $file (@_) { # each loop, evaluate once in list context
        print_file $file; 
    }

    foreach (@_) { # perl will assume $_ is to be the loop variable
    # WARNING: $_ is a global variable.
    # Example: at the end of a for look the last value of $_ is ''undef''
        print $_;
    }
}

=cut

# for loop
for (INITILIZE; TEST; STEP) {
    BODY;
}
for (my $i=0; $i <= 9; $i++) {
    print "$i\n";
}

foreach my $i (0..9) { # <- for and foreach are synonyms)
    print "$i\n";
}
