#!C:\strawberry\perl\bin\perl.exe

# Take two numbers from the command line, print their binary representation and
# their logical AND-ed value

use 5.020;
use warnings;

die "Give two numbers as arguments\n" if ( @ARGV < 2 );

my ( $num1, $num2 ) = @ARGV;

my $maxlen = &longer_len( &to_bin_string( $num1, $num2 ) );

printf "  %${maxlen}b\n& %${maxlen}b\n  %s\n  %${maxlen}b\n",
    $num1, $num2, '-' x $maxlen, $num1 & $num2;

sub to_bin_string {
    my @strings;
    foreach (@_) {
        push @strings, sprintf "%b\n", $_;
    }
    @strings;
}

sub longer_len {
    my ( $s1, $s2 ) = @_;
    if ( length($s1) > length($s2) ) {
        length($s1);
    }
    else {
        length($s2);
    }
}
