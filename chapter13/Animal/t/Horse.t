use strict;
use warnings;

use Test::More tests => 2;

BEGIN {
    use_ok('Horse') || print "Bail out!\n";
}

diag("Testing Horse $Horse::VERSION, PERL$], $^X");

#check sound()
is(&Horse::sound, 'neigh', 'Sound returns horse sound');
