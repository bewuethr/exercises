use strict;
use warnings;

use Test::More tests => 2;

BEGIN {
    use_ok('Cow') || print "Bail out!\n";
}

diag("Testing Cow $Cow::VERSION, PERL$], $^X");

#check sound()
is(&Cow::sound, 'moooo', 'Sound returns cow sound');
