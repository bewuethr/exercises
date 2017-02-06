#!C:\strawberry\perl\bin\perl.exe

# Use DateTime to compute the interval between now and a date given on the
# command line as year month day

use strict;
use warnings;
use DateTime;
use Time::Piece;

unless ( @ARGV == 3 ) {
    die "Usage: perl chapter11_ex02.pl year month day\n";
}

my $now = localtime;
my $date_from = DateTime->new(
    year    => $now->year,
    month   => $now->mon,
    day     => $now->mday,
);
    
my ( $year, $month, $day ) = @ARGV;
my $date_to = DateTime->new(
    year    => $year,
    month   => $month,
    day     => $day,
);

my $duration = $date_to - $date_from;

my @units = $duration->in_units( qw( years months days ) );
printf "%d years, %d months and %d days\n", @units;
