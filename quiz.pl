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
    "Re-configure the default cgi-bin directory",
    "Configure a website with authentication",
    "Configure firewall for secure,insecure web and ssh",
    "Configure ftp accessible to one a single ip address",
    "Restrict ssh access with TCP wrappers by hostname or IP",
    "Restrict vsftpd access to a single local user (using ftpusers) 10.6",
    "Alter options for service startup (using /etc/sysconfig/<FILE>)",
    "Configure public/private key-based auth for ssh",
    "Configure tom to access sue's account via ssh",
    "Configure user-level restrictions for ssh",
    "Configure ssh to use port 8122 instead",
    "Configure /virt/web and /virt/web/cgi-bin with appropriate SELinux context",
    "Configure a sys util report to run monthly on the 2nd with only mem and net stats - Ch12",
    "Configure a system utilization report for the 21st of every month, written to a sysstat_report.txt file. Report parameters can be limited to memory and network statistics. - Ch12",
    "Generate a system utilization report for a single day, written to a morestat_report.txt file. Report parameters should include information on CPU usage, RAM statistics, disk usage, and network data. The report should be presented in a more visible format, something easily usable by the awk command utility. - Ch12",
    "Disable response to ping (via kernel) - Ch12",
    "Set up a custom route to the network with the outsider1.example.org system. Use the same gateway address as the default gateway. - Ch12",
    "Configure caching DNS (with firewall) on local system. 13.1",
    "Configure cachine DNS server that forwards. Clear cache. 13.2",
    "Configure postfix for user auth on local system. Forward emails to local root. 13.3",
    "Configure postfix for access by local network but with smarthost forwarding. 13.4",
    "Configure on NTP as peer to primary NTP server. 13.5",
    "Edit the default homepage of apache /usr/share/doc/HTML 14.1",
    "Configure Apache so that requests to http://servername/~user are served by the public_html directory in the corresponding user's home directory. Access through the browser should be limited to the user owner of that directory via basic authentication 14.2",
    "Configure a httpd group directory with restricted acccess 14.3",
    "Install, setup and enable basic samba. Don't forget any packages. Don't forget to enable. 15.1",
    "Check available samba documentation with rpm 15.2",
    "Backup smb.conf. Configure a workgroup. Limit samba access by host. Limit by ip. 15.3",
    "Create a common user on both systems. Configure samba [homes] to be writeable to a single user accessible from a single network. 15.4",
    "Create a public samba share /home/public , accessible to all. Set perms to protect deletion. 15.5",
    "Create two users. Create a samaba share limited to those two in a group (ref. Ch. 8). Setup a third to be the mount.cifs access. 15.6",
    "Make samba sure settings are persistent. 15.7",
    "NFS: Configure a directory named /shared. Add a single file to that directory. Configure no_root_squash directive. Mount that system on a local /testing directory. 16.1",
    "NFS: Share the /home directories and provide write permissions to the client computer. On the client, set up the /home directory from the NFS server to be mounted the next time that client computer is booted. Since the client computer probably already has a /home directory, set it up on the /remote directory. 16.2",
	"SELinux: Prevent write to any and all NFS shares. 16.3",
	"NFS: Configure /shared NFS directory with Kerberos authentication, communication integrity, and encryption. 

	Go to the remote client tester1.example.com and make sure you can mount the NFS share using any of the sec=krb5, sec=krb5i, and sec=krb5p security options.

	Then, test each of the following scenarios. What happens when you try to mount the NFS share?

	1. Stop the nfs-secure-server service on server1.example.com. Try to mount the NFS share.

	2. Start the nfs-secure-server service on server1.example.com. Stop the nfs-secure service on tester1.example.com. Try to mount the NFS share.

	3. Start the nfs-secure service on tester1.example.com. Move the /etc/krb5.keytab file to a different location on tester1.example.com. Try to mount the NFS share.

	4. Restore the file /etc/krb5.keytab on tester1.example.com. Move the /etc/krb5.conf file to a different location on tester1.example.com. Try to mount the NFS share.

	5. Restore the file /etc/krb5.conf on tester1.example.com. Remove the nfs service in firewalld. Try to mount the NFS share.

	6. Add the nfs service in firewalld. Stop the KDC services. Try to mount the NFS share. 16.4"

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
