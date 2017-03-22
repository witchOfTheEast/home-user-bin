#!/usr/bin/perl
use warnings;
use strict;

my $want_num = shift @ARGV;

my @questions = (
    "Allow SSH access from 1 network while denying access from others",
    "Create an shared executable, accessible by all users on the system",
    "Forward ports from one network to another",
    "Configure aggregated links",
    "Configure IPV6 2001:db8:1::0/64 addresses on two systems",
    "Configure postfix as a relay server",
    "Configure postfix as a null server",
    "Configure a share on a samba server",
    "Configure a samba client for multi-user mounting",
    "Configure NFS exports with KERBEROS",
    "Configure NFS client mounts with KERBEROS",
    "Configure a webserver with SSL",
    "Configure two virtual servers, with a private directory on one",
    "Script with read line",
    "Configure an iscsi target",
    "Configure an iscsi initiator, partition after and mount on boot",
    "Import a maria DB",
    "Perform SQL queries using multiple tables",
    "Configure a 100M xfs partition",
    "Configure a VG of 500M, with an LV of 400M, resize the LV to 450M",
    "Configure a configure 2 PVs, create a VG with PE size 2M",
    "Configure automount of NFS share",
);

my @selected_questions = ();

my $length = @questions;

# for testing the number of questions to select
#my $num_questions = int(rand($length));


my $num_questions = $want_num;

print "How many questions: $num_questions\n";
for my $i (1..$num_questions) {
    my $target_num = int(rand(scalar @questions));
    my $target_question = splice(@questions,$target_num,1);
    push @selected_questions,$target_question;
    #print "Selected: @selected_questions\n";
}

my $cur_num = 1;
for (@selected_questions) {
    print "$cur_num: $_\n\n";
    $cur_num++;

}

#print "Remaining Questions: @questions\n";
#print "Selected: @selected_questions\n";

#print "Total number of questions: $length\n";
#print "Perhaps another way to length:", scalar @questions;
#print "\nNumber of selected: $num_questions\n";
