use strict;
use warnings;

use Test::More;

BEGIN {
    use_ok('Cow') || print "Bail out!\n";
}

diag("Testing Cow $Cow::VERSION, PERL$], $^X");

can_ok('Cow', qw(new name color sound speak));

my $cow = Cow->new(name => 'Bella', color => 'spotted');
isa_ok($cow, 'Cow');
is($cow->name, 'Bella', 'Cow gets name right');
is($cow->sound, 'moooo', 'Cow gets default sound right');
is($cow->color, 'spotted', 'Cow gets color right');

done_testing();
