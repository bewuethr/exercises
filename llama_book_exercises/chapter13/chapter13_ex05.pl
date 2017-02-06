#!C:\strawberry\perl\bin\perl.exe

# Write a program that works like mv: rename the first command-line argument
# to the second one; if the second argument is a directory, use the same
# original basename in the new directory

use 5.020;
use warnings;
use File::Basename;
use File::Spec::Functions;

die "Usage: chapter13_ex05.pl from_name to_name\n" unless @ARGV == 2;
my ( $from, $to ) = @ARGV;

if ( -d $to ) {
    my $basename = basename $from;
    $to = catfile( $to, $basename );
}

rename $from, $to or die "Couldn't rename $from to $to: $!";
