#!C:\strawberry\perl\bin\perl.exe

# Prompt for message, append message to log file with time stamp

use 5.020;
use warnings;

open LOG, '>>', 'logfile' or die "Can't open logfile: $!";

print "Enter message for log: ";
my $message = <STDIN>;

my $now_string = localtime;
print LOG "[$now_string] $message";
