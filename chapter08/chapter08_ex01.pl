#!C:\strawberry\perl\bin\perl.exe

# Write a program that prints today's date and the day of the week, but allows
# the user to choose to send the output to a file, a scalar or both at the same
# time, using a single print statement. If output is sent to a scalar, print
# the scalar's value to STDOUT at the end of the program.

use 5.020;
use warnings;
use IO::Tee;

die "Usage: perl chapter08_ex01.pl (s|f|sf)\n" if ( @ARGV < 1 or not $ARGV[0] =~ /s|f/ );

my @mon_abbr  = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);
my @wday_abbr = qw(Sun Mon Tue Wed Thu Fri Sat);

my ($mday, $mon, $year, $wday) = (localtime)[3..6];
$year += 1900;


my $arg = $ARGV[0]; 
my @handles;
my $string;

if ( $arg =~ /s/ ) {
    open my $scalar_fh, '>', \$string;
    push @handles, $scalar_fh;
}
if ( $arg =~ /f/ ) {
    my $fname = 'ex08_01_out.txt';
    open my $file_fh, '>', $fname
        or die "Can't open $fname: $!";
    push @handles, $file_fh;
}

my $tee_fh = IO::Tee->new(@handles);

say $tee_fh "$wday_abbr[$wday], $mon_abbr[$mon] $mday, $year";

print $string if defined $string;
