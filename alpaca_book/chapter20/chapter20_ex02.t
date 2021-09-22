#!C:\Strawberry\perl\bin\perl.exe

# Test Test::My::List::Util

use strict;
use warnings;
use Test::More;

BEGIN { use_ok('My::List::Util') || print "Bail out!\n"; }
BEGIN { use_ok('Test::My::List::Util') || print "Bail out!\n"; }

ok(defined &sum, 'sum() is exported');
ok(defined &sum_ok, 'sum_ok() is exported');

sum_ok(sum(1, 2, 3, 4), 10, 'sum works fine');
sum_ok(sum(1, 2, 3, 4), 9, 'sum works fine');

done_testing();
