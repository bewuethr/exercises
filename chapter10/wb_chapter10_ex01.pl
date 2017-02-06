#!C:\strawberry\perl\bin\perl.exe

# Read lines and print them, unless they contain "ruby" or "python"

use 5.020;
use warnings;

while (<>) {
    print unless /ruby|python/;    # or: next if m/ruby|python/; print;
}
