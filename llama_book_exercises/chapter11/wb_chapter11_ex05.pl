#!C:\strawberry\perl\bin\perl.exe

# Use LWP::Simple to download and store the HTML source for
# http://perldoc.perl.org

use strict;
use warnings;
use LWP::Simple;

getstore( 'http://perldoc.perl.org', 'perldoc.html' );
