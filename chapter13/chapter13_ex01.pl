#!C:\strawberry\perl\bin\perl.exe

# Ask user for directory name and change to that directory. If the input is all
# whitespace, change to the home directory. After changing, list the ordinary
# contents (not starting with a dot) alphabetically. If the change doesn't
# succeed, warn the user, don't try showing the contents.

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


foreach my $filename ( glob '*' ) {
    say $filename;
}
