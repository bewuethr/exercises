#!C:\strawberry\perl\bin\perl.exe

# Change the time zone using the TZ environment variable, then use 'exec' to
# the 'date' command

use 5.020;
use warnings;

$ENV{'TZ'} = 'PST8PDT';
exec 'date';
die "date couldn't run: $!";
