use strict;
use warnings;

use Test::More;

BEGIN {
    use_ok('Horse') || print "Bail out!\n";
}

diag("Testing Horse $Horse::VERSION, PERL$], $^X");

can_ok('Horse', qw(new name color sound speak));

my $horse = Horse->new(name => 'Mr. Ed');
isa_ok($horse, 'Horse');
is($horse->name, 'Mr. Ed', 'Horse gets name right');
is($horse->sound, 'neigh', 'Horse gets default sound right');
is($horse->color, 'brown', 'Horse color default is brown');

done_testing();
