#!C:\strawberry\perl\bin\perl.exe

# Match word that is capitalized, but not ALL capitalized

use 5.020;
use warnings;

while (<>) {
    if (/[A-Z][a-z]+/) {
        print;
    }
}
