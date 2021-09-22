package Animal;

use strict;
use warnings;
use Moose::Role;
use namespace::autoclean;

=head1 NAME

Animal - class for Alpaca book

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Class for all animals

=cut

requires qw(sound);

has 'name'  => (is => 'rw');
has 'color' => (is => 'rw');

sub speak {
    my $self = shift;
    print $self->name, " goes ", $self->sound, "\n";
}

1;
