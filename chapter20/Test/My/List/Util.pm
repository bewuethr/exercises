package Test::My::List::Util;

# Write a test module with a single function sum_ok, which takes two arguments:
# the actual sum and the expected sum. Print a diagnostic message if the two do
# not match.

use strict;
use warnings;

use Exporter qw(import);
use vars qw(@EXPORT $VERSION);

use Test::Builder;

my $Test = Test::Builder->new();

$VERSION = '0.10';
@EXPORT = qw(sum_ok);

sub sum_ok {
    my ($actual, $expected, $msg) = @_;
    $msg //= "Sum is correct";
    if ($actual != $expected) {
        $Test->diag("Expected $expected, but got $actual.\n");
        $Test->ok(0, $msg);
    }
    else {
        $Test->ok(1, $msg);
    }
}

1;
