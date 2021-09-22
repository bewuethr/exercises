package RaceHorse;

use strict;
use warnings;
use Storable;

use parent qw(Horse);

sub named {
    my $self = shift->SUPER::named(@_);
    $self->{$_} = 0 for qw(wins places shows losses);
    (my $fname = $self->name) =~ s/ //g;    # Remove space for file name
    $fname .= '.dat';
    if (-e $fname) {
        print "Reading from $fname...\n";
        my $dat_ref = retrieve $fname;
        @$self{qw(wins places shows losses)} = @$dat_ref;
    }
    $self;
}

sub DESTROY {
    my $self = shift;
    $self->SUPER::DESTROY if $self->can('SUPER::DESTROY');
    (my $fname = $self->name) =~ s/ //g;
    $fname .= '.dat';
    print "Writing  to $fname...\n";
    store [ @$self{qw(wins places shows losses)} ], $fname;
}

sub won { shift->{wins}++; }

sub placed { shift->{places}++; }

sub showed { shift->{shows}++; }

sub lost { shift->{losses}++; }

sub standings {
    my $self = shift;
    join ', ', map "$self->{$_} $_", qw(wins places shows losses);
}

1;
