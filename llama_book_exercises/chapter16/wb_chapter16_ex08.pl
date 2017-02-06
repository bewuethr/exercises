#!C:\strawberry\perl\bin\perl.exe

# Use the Windows 'title' command to create a progress bar in the title bar:
# add a '*' character once a second for a minute

use 5.020;
use warnings;

foreach ( 1..60 ) {
    sleep 1;
    my $stars = '*' x $_;
    system "title $stars";  # simpler: system 'title', '*' x $_;
}
