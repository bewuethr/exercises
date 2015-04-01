#!C:\strawberry\perl\bin\perl.exe

# Print out any input line that ends with whitespace (other than just a newline);
# put a marker character at the end of the output line

use 5.020;
use warnings;

while (<>) {
    chomp;
    if (/\s\z/) {
        say "$_*";
    }
    else {
        say "No match";
    }
}
