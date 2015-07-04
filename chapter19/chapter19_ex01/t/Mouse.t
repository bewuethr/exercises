use strict;
use warnings;

use Test::More;

BEGIN {
    use_ok('Mouse') || print "Bail out!\n";
}

diag("Testing Mouse $Mouse::VERSION, PERL$], $^X");

can_ok('Mouse', qw(new name color sound speak));

my $mouse = Mouse->new(name => 'Mickey');
isa_ok($mouse, 'Mouse');
is($mouse->name, 'Mickey', 'Mouse gets name right');
is($mouse->sound, 'squeak', 'Mouse gets default sound right');
is($mouse->color, 'white', 'Mouse color default is white');

done_testing();
