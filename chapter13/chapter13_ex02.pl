#!C:\strawberry\perl\bin\perl.exe

# Modify the previous program to include all files, not just the ones that
# don't begin with a dot

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


foreach my $filename ( sort glob '.* *' ) {
    say $filename;
}
