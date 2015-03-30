#!/C:\strawberry\perl\bin\perl.exe

# Explain output and find bug

use strict;
use warnings;

print format_number( 9999 ), "\n";

sub format_number {
    local $_ = shift;
    1 while s/^([-+]?\d+)(\d{3})/$1,$2/;
    $_;  # was print - returns 1 instead of $_
}
