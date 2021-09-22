#!C:\strawberry\perl\bin\perl.exe

# Parse the ISBN from this book (9781449393090) using Business::ISBN. Extract
# group code and publisher code

use 5.020;
use warnings;
use Business::ISBN;

my $isbn13 = Business::ISBN->new('9781449393090');

say "ISBN is ", $isbn13->as_string;
say "Group code: ", $isbn13->group_code;
say "Publisher code: ", $isbn13->publisher_code;
