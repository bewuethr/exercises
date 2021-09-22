package Mouse;

use strict;
use warnings;
use Moose;
use namespace::autoclean;

extends 'Animal';

=head1 NAME

Mouse - class for the Alpaca book

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Mouse class, subclasses animal

=cut

has 'color' => (is => 'rw', default => 'white');

sub sound { 'squeak' }

after 'speak' => sub {
    print "[but you can barely hear it!]\n";
};

__PACKAGE__->meta->make_immutable;

1;
