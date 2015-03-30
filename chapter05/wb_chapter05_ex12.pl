#!C:\strawberry\perl\bin\perl.exe

# Mimic dos2unix: convert file with crlf endings into newline only

use 5.020;
use warnings;

my $file = shift @ARGV;
open my $fh_in, '<:crlf', $file or die "Can't open $file: $!";

open my $fh_out, '>', "$file.unix" or die "Can't open $file.unix: $!";
binmode $fh_out;

while (<$fh_in>) {
    chomp $_;
    print $fh_out "$_\n";   # doesn't properly work: Windows inserts crlf
}

close $fh_in;
close $fh_out;
