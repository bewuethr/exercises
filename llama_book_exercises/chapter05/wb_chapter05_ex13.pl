#!C:\strawberry\perl\bin\perl.exe

# Convert UTF-8 encoded file to UTF16-BE

use 5.020;
use warnings;

my ( $file_in, $file_out ) = @ARGV;

open my $fh_in, '<:encoding(UTF-8)', $file_in or die "Can't open $file_in: $!";
open my $fh_out, '>:encoding(UTF-16BE)', $file_out
    or die "Can't open $file_out: $!";

while (<$fh_in>) {
    print $fh_out $_;
}
