use strict;
use warnings;

use Test::More tests => 3;

BEGIN {
    use_ok('Mouse') || print "Bail out!\n";
}

diag("Testing Mouse $Mouse::VERSION, PERL$], $^X");

#check sound()
is(&Mouse::sound, 'squeak', 'Sound returns mouse sound');

#check speak()
my $mouse = 'Mouse';
is($mouse->speak, 1, 'Speak is successful');
