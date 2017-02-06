#!C:\strawberry\perl\bin\perl.exe

# Use File::Spec, take a directory path from the command line and add it to
# every file in the current directory to create an absolute path.

use strict;
use warnings;
use File::Spec;

my $dirname = shift @ARGV;

my @file_names = glob(".* *");

foreach my $fname (@file_names) {
    my $new_name = File::Spec->catfile( $dirname, $fname );
    print "$new_name\n";
}
