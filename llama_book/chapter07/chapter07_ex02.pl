#!C:\strawberry\perl\bin\perl.exe

# Modify previous to match Fred as well

use 5.020;
use warnings;

while (<>) {
    if (/[Ff]red/) {
        print;
    }
}
