use strict;
use warnings;

use Test::More;

BEGIN {
    use_ok('Animal') || print "Bail out!\n";
}

diag("Testing Animal $Animal::VERSION, Perl $], $^X");

can_ok('Animal', qw(new name color sound speak));

my $animal = Animal->new(
    name => 'Generic animal',
    color => 'Generic color',
);
isa_ok($animal, 'Animal');
is($animal->name, 'Generic animal', 'Animal gets name right');
is($animal->color, 'Generic color', 'Animal gets color right');
is($animal->sound, 'Grrr!', 'Animal gets sound right');

done_testing();
