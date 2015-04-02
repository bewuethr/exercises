#!C:\strawberry\perl\bin\perl.exe

# Read tab-separated file and output it as pipe-separated file ('|')

use 5.020;
use warnings;

while (<>) {
    print join "|", split /\t/;
}
