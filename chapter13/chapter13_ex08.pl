#!C:\strawberry\perl\bin\perl.exe

# Find any symbolic links in the current directory and print their values, like
# ls -l would: name -> value

use 5.020;
use warnings;

foreach my $file ( glob '.* *' ) {
    printf "%s -> %s\n", $file, readlink $file if -l $file;
}
