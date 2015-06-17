use strict;
use warnings;

use Test::More tests => 5;

BEGIN {
    use_ok('Animal') || print "Bail out!\n";
}

diag("Testing Animal $Animal::VERSION, Perl $], $^X");

# they have to be defined
ok(defined &Animal::speak, 'Animal::speak is defined');

# check that sound() dies
eval { Animal->sound() } or my $at = $@;
like($at, qr/You have to/, 'sound() dies with a message');    

# check that speak() dies too
eval { Animal->speak() } or my $at = $@;
like($at, qr/You have to/, 'speak() dies with a message');    

{
    package Foofle;
    use parent qw(Animal);
    sub sound { 'foof' }

    &Test::More::is(
        Foofle->speak,
        1,
        'An Animal subclass prints successfully'
    );
}
