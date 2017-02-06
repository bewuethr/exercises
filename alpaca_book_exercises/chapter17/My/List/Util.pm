package My::List::Util;

# Extend this exercise from Chapter 14 to export its sum and shuffle functions.

use strict;
use warnings;

use Exporter qw(import);

our @EXPORT = qw(sum shuffle);

sub sum {
    my $sum;
    foreach my $elem (@_) {
        $sum += $elem;
    }
    $sum;
}

sub shuffle {
    my @deck = @_;
    return unless @deck;

    my $i = @deck;
    while (--$i) {
        my $j = int rand ($i+1);
        @deck[$i,$j] = @deck[$j,$i];
    }
    return @deck;
}

1;
