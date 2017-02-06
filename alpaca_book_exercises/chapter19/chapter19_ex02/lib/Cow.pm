package Cow;

use strict;
use warnings;
use Moose;
use namespace::autoclean;

with 'Animal';

=head1 NAME

Cow - class for the Alpaca book

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Cow class, subclasses animal

=cut

sub sound { 'moooo' }

__PACKAGE__->meta->make_immutable;

1;
