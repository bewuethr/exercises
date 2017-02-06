#!C:\strawberry\perl\bin\perl.exe

# Take filename from command line; if file exists, print first line, otherwise
# die

use 5.020;
use warnings;

my $file = shift @ARGV;
open my $fh, '<', $file
    or die "Could not open $file: $!";

print scalar <$fh>;
