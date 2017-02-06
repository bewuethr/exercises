#!C:\strawberry\perl\bin\perl.exe

# Write a program that works like ln, making a hard link from the first
# command-line argument to the second one

use 5.020;
use warnings;
use File::Basename;
use File::Spec::Functions;

die "Usage: chapter13_ex06.pl from_name to_name\n" unless @ARGV == 2;
my ( $from, $to ) = @ARGV;

if ( -d $to ) {
    my $basename = basename $from;
    $to = catfile( $to, $basename );
}

link $from, $to or die "Couldn't link $from to $to: $!";
