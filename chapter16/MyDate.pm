# Write a module named MyDate that has an AUTOLOAD method which handles the
# calls to the methods named day, month and year, returning the approriate
# value for each one. For any other method, AUTOLOAD should Carp about the
# unknown method name.

package MyDate;

use strict;
use warnings;
use Carp qw(carp);

sub new {
    my $class = shift;
    my $day   = shift // 1;
    my $month = shift // 'January';
    my $year  = shift // 1970;
    my $self  = { 
        Day   => $day,
        Month => $month,
        Year  => $year,
    };
    bless $self, $class;
}

sub AUTOLOAD {
    my @elements = qw(day month year);
    our $AUTOLOAD;
    if ($AUTOLOAD =~ /::(\w+)$/ and grep $1 eq $_, @elements) {
        my $field = ucfirst $1;
        {
            no strict 'refs';
            *$AUTOLOAD = sub { $_[0]->{$field} };
        }
        goto &$AUTOLOAD;
    }
    (my $method = $AUTOLOAD) =~ s/.*:://s;
    carp "$_[0] does not understand $method\n";
}

1;
