#!C:\strawberry\perl\bin\perl.exe

# Rewrite with a directory handle instead of a glob

use 5.020;
use warnings;

print "Enter a directory: ";
chomp( my $dirname = <STDIN> );

if ( $dirname =~ m/\A\s*\Z/ ) {
    chdir or die "Cannot chdir to home directory: $!";
}
else {
    chdir $dirname or die "Cannot chdir to $dirname: $!";
}

opendir my $dh, "." or die "Cannot open $dirname: $!";
foreach my $filename ( sort readdir $dh ) {
    say $filename;
}
