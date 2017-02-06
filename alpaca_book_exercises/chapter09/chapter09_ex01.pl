#!C:\strawberry\perl\bin\perl.exe

# Modify the 'rightmost' program to take a hash reference of patterns and
# return the key of the rightmost match.

use 5.020;
use warnings;

my %patterns = (
    Gilligan   => qr/(?:Wiley )?Gilligan/,
    'Mary-Ann' => qr/Mary-Ann/,
    Ginger     => qr/Ginger/,
    Professor  => qr/(?:The )?Professor/,
    Skipper    => qr/Skipper/,
    'A Howell' => qr/Mrs?. Howell/,
);

my $key = rightmost( 
    'There is Mrs. Howell, Ginger, and Gilligan, Skipper', \%patterns
);

say "Key of the rightmost match: $key";
	
sub rightmost {
    my( $string, $patterns ) = @_;
    
    my ( $rightmost_pos, $rightmost_key ) = ( -1, undef );
    while( my( $key, $value ) = each %{$patterns} ) {
        my $position = $string =~ m/$value/ ? $-[0] : -1;
        if ( $position > $rightmost_pos ) {
            $rightmost_pos = $position;
            $rightmost_key = $key;
        }
	}

return $rightmost_key;
}
