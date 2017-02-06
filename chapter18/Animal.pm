package Animal;

use strict;
use warnings;

sub named {
    my ($class, $name) = @_;
    my $self = { Name => $name, Color => $class->default_color };
    bless $self, $class;
}

sub name {
    my $either = shift;
    ref $either
        ? $either->{Name}
        : "an unnamed $either";
}

sub speak {
    my $either = shift;
    print $either->name, ' goes ', $either->sound, "!\n";
}

sub sound {
    die 'You have to define sound() in a subclass'
}

sub eat {
    my $either = shift;
    my $food = shift;
    print $either->name, " eats $food.\n";
}

sub default_color { 'brown' }

sub color {
    my $self = shift;
    $self->{Color};
}

sub set_color {
    my $self = shift;
    $self->{Color} = shift;
}

1;
