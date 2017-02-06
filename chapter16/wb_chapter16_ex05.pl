#!C:\strawberry\perl\bin\perl.exe

# Modify the program from exercise 1 to remove the value from the PATH
# environment variable

use 5.020;
use warnings;

$ENV{PATH} = '';

$ENV{'TZ'} = 'PST8PDT';
exec 'date';    # doesn't depend on PATH under Windows, apparently
die "date couldn't run: $!";
