use strict;
use warnings;

use Test::More tests => 2;

BEGIN {
    use_ok('Person') || print "Bail out!\n";
}

diag("Testing Person $Person::VERSION, PERL$], $^X");

#check sound()
is(Person->sound, 'hmmmmm', 'Sound returns person sound');
