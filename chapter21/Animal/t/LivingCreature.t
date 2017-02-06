use strict;
use warnings;

use Test::More tests => 5;

BEGIN {
    use_ok('LivingCreature') || print "Bail out!\n";
}

diag("Testing LivingCreature $LivingCreature::VERSION, Perl $], $^X");

# they have to be defined
ok(defined &LivingCreature::speak, 'LivingCreature::speak is defined');

# check that sound() dies
my $at;
eval { LivingCreature->sound() } or $at = $@;
like($at, qr/You have to/, 'sound() dies with a message');    

# check that speak() works
my $says = LivingCreature->speak('Hello');
is($says, 1, 'speak() works for speaking');    

eval { LivingCreature->speak } or $at = $@;
like($at, qr/You have to/, 'speak() dies with a message');    
