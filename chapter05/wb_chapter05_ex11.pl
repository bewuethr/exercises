#!C:\strawberry\perl\bin\perl.exe

# Print command-line arguments using CRLF as line separator: to STDOUT, using
# say, using an encoding with open

use 5.020;
use warnings;

binmode STDOUT, ':crlf';

foreach (@ARGV) {
   say $_;
}
