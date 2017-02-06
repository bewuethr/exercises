package Animal;

use strict;
use warnings;
use Moose;
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

has 'name'  => (is => 'rw');
has 'color' => (is => 'rw');
has 'sound' => (is => 'ro', default => sub { 'Grrr!' });

sub speak {
    my $self = shift;
    print $self->name, " goes ", $self->sound, "\n";
}

__PACKAGE__->meta->make_immutable;

1;
