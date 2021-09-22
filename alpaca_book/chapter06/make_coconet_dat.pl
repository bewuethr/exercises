#!C:\strawberry\perl\bin\perl.exe

# Program to create data log file for a day

use 5.020;
use warnings;

my $records = $ARGV[0] // 10_000;

my @network = (
    [ qw(crew.hut gilligan skipper) ],
    [ qw(girl.hut ginger maryann) ],
    [ qw(hut professor) ],
    [ qw(copyroom.hut laser3 fileserver) ],
);

my @hosts = map {
    my( $domain, @hosts ) = @$_;
    
    map { "$_.$domain" } @hosts;
} @network;

open my $fh, '>', $ARGV[1] or die "Can't open $ARGV[1]: $!";

foreach ( 1 .. $records ) {
    my( $host1, $host2 ) = map { $hosts[ rand @hosts ] } 1..2;
    my $bytes = int rand 10_000;
    say $fh ( join "\t", $host1, $host2, $bytes );
}
