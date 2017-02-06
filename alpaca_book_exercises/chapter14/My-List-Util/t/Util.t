#!C:\strawberry\perl\bin\perl.exe -T

use strict;
use warnings;

use Test::More 0.62 tests => 12;

BEGIN {
    require_ok('My::List::Util') || BAIL_OUT();
}

diag("Testing My::List::Util $My::List::Util::VERSION, Perl $], $^X");

# Are functions defined?
ok(defined &My::List::Util::sum, 'My::List::Util::sum is defined');
ok(defined &My::List::Util::shuffle, 'My::List::Util::shuffle is defined');

my @list = (1, 2, 3, 4, 5);

is(&My::List::Util::sum(@list), 15, 'The sum of (1, 2, 3, 4, 5) is 15');
is(&My::List::Util::sum(10**10, 10**10), 2*10**10, 'Sum can handle large numbers');
is(&My::List::Util::sum(@list), 15, 'Sum can handle array arguments');
is(&My::List::Util::sum(), undef, 'Sum returns undef for an empty list');

# Could have added: floats, all bad arguments, qw(1 2 3), qw(a b 4 5)

is(&My::List::Util::shuffle(1), (1), 'Shuffle handles single element list');
is(scalar &My::List::Util::shuffle(@list), 5, 'Shuffled and unshuffled list have the same length');
is(&My::List::Util::sum(&My::List::Util::shuffle(@list)),
    &My::List::Util::sum(@list), 'Sum of shuffled and unshuffled list are the same');

my @shuffled = &My::List::Util::shuffle(@list);
is_deeply([sort @list], [sort @shuffled], 'Shuffled and unshuffled list contain same elements');
isnt("@list", "@shuffled", 'The list is shuffled');

done_testing();
