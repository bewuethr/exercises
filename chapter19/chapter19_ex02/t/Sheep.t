use strict;
use warnings;

use Test::More;

BEGIN {
    use_ok('Sheep') || print "Bail out!\n";
}

diag("Testing Sheep $Sheep::VERSION, PERL$], $^X");

can_ok('Sheep', qw(new name color sound speak));

my $sheep = Sheep->new(name => 'Woolsley', color => 'black');
isa_ok($sheep, 'Sheep');
is($sheep->name, 'Woolsley', 'Sheep gets name right');
is($sheep->sound, 'baaaah', 'Sheep gets default sound right');
is($sheep->color, 'black', 'Sheep gets color right');

done_testing();
