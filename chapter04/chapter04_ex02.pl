#!C:\strawberry\perl\bin\perl.exe

# Using the final version of check_required_items, write a subroutine
# check_items_for_all that takes as its only parameter a reference to a hash
# whose keys are the people aboard the Minnow and whose corresponding values
# are array references of the things they intend to bring. The newly
# constructed subroutine should call check_required_items for each person in
# the hash, updating their provisions list to include the required items.

use 5.020;
use warnings;

my @skipper   = qw(blue_shirt hat jacket preserver sunscreen);
my @professor = qw(suncreen water_bottle slide_rule batteries radio);
my @gilligan  = qw(red_shirt hat lucky_socks water_bottle);

my %all = (
    Gilligan  => \@gilligan,
    Skipper   => \@skipper,
    Professor => \@professor,
);

check_items_for_all(\%all);

sub check_items_for_all {
    my $all = shift;
    foreach my $passenger ( keys %$all ) {
        check_required_items( $passenger, $$all{$passenger} );  # or $all->{$person}
    }
}

sub check_required_items {
    my $who = shift;
    my $items = shift;

    my %whose_items = map { $_, 1 } @$items;
    
    my @required = qw(preserver sunscreen water_bottle jacket);
    my @missing = ( );

    foreach my $item (@required) {
        unless ( $whose_items{$item} ) {    # not found in list?
            print "$who is missing $item.\n";
            push @missing, $item;
        }
    }

    if (@missing) {
        print "Adding @missing to @$items for $who.\n";
        push @$items, @missing;
    }
}


