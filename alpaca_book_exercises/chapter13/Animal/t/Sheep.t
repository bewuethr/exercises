use strict;
use warnings;

use Test::More tests => 2;

BEGIN {
    use_ok('Sheep') || print "Bail out!\n";
}

diag("Testing Sheep $Sheep::VERSION, PERL$], $^X");

#check sound()
is(&Sheep::sound, 'baaaah', 'Sound returns sheep sound');
