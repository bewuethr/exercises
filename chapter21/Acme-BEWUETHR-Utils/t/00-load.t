#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Acme::BEWUETHR::Utils' ) || print "Bail out!\n";
}

diag( "Testing Acme::BEWUETHR::Utils $Acme::BEWUETHR::Utils::VERSION, Perl $], $^X" );
