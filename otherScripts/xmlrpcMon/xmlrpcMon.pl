#!/bin/perl
use warnings;
use strict;

# Created on 2016/09/14
# Support testing of the WordFench Wordpress plugin
# Periodically check the httpd access logs
# Look for excessive POST calls to xmlrpc.php
# Report if threshold exceeded


sub getLastCount {
    my $record_loc = "/root/bin/xmlrpcMon/.lastCount";
    open my $COUNTFILE, '+<', "$record_loc" or die "Can't '$record_loc': $!";
    my @lines = <$COUNTFILE>;

    my %last_count;

    foreach (@lines) {
        my @line = split /\s+/, $_;
        $last_count{$line[0]} = "$line[1]";
    }
    return %last_count;
}


my $mailto = "justthisguyrandall\@gmail.com";
my %target_files = (
    "test" => "/root/test",
    #"AMM" => "/var/log/httpd/testing.adventistmediaministries.com-access_log",
    #"AMC" => "/var/log/httpd/testing.adventistmediacenter.com-access_log"
);

sub getNewCount {
    my %new_count;
    foreach my $key (keys %target_files) {
        my $target_name = $target_files{$key};

        open my $FILE, "$target_name" or die "Can't '$target_name': $!";

        my $pattern = "xmlrpc.php";
        my $line_count = 0;
        while (my $line = <$FILE>) {
            print "\$line_count: $line_count\n";
            if ($line =~ m/$pattern/) {
                $line_count++;
            }
        }
        close $FILE;
        $new_count{$key} = $line_count;
    }
    return %new_count; 
}

sub sendEmail {
    my $to = 'rdunn@sdamedia.com';
    my $from = 'webadmin@web01.com';
    my $subject = 'Increased number of POST xmlrpc.php';
    my $message = 'You should check WordFench';
    
    open(MAIL,"|/usr/sbin/sendmail -t");

    print MAIL "TO: $to\n";
    print MAIL "FROM: $from\n";
    print MAIL "SUBJECT: $subject\n";
    print MAIL $message;

    close(MAIL);
}
my %last_count = getLastCount();
my %new_count = getNewCount();

sub printstupid {
    foreach my $key (keys %new_count) {
    print "$key => $new_count{$key}\n";
}

foreach my $key (keys %last_count) {
    print "$key => $last_count{$key}\n";
}
}
printstupid();

for my $key (keys %new_count) {
    if ($last_count{$key} == $new_count{$key}) {
        print "$key has not changed";
    }
    else {
        #sendEmail($key);
        writeNewCount();
    }
}




=being comment
seek $COUNTFILE,0,0;
truncate $COUNTFILE,0;
print $COUNTFILE "$line_count\n";
close $COUNTFILE;
=end
