#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok( 'Acme::BEWUETHR::Utils' ) || print "Bail out!\n";
}

diag( "Testing Acme::BEWUETHR::Utils $Acme::BEWUETHR::Utils::VERSION, Perl $], $^X" );

ok(defined &sum, 'Acme::BEWUETHR::Utils::sum is defined');

my @list = (1, 2, 3, 4, 5);

is(sum(1, 2, 3, 4, 5), 15, 'The sum of (1, 2, 3, 4, 5) is 15');
is(sum(10**10, 10**10), 2*10**10, 'sum can handle large numbers');
is(sum(@list), 15, 'sum can handle array arguments');
is(sum(), undef, 'sum returns undef for an empty list');

done_testing();
