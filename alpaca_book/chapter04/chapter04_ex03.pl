#!C:\strawberry\perl\bin\perl.exe

# Modify the crew roster program to add a location field for each castaway. at
# the start, set each person's location to "The Island". After you've added
# that field to each person's hash, change the Howell's lcoations to "The
# Island Country Club". Make a report of everyone's location.

use 5.020;
use warnings;

my %gilligan_info = (
    name     => 'Gilligan', 
    hat      => 'White', 
   	shirt    => 'Red', 
    position => 'First Mate',
);
my %skipper_info = (
    name     => 'Skipper',
    hat      => 'Black',
    shirt    => 'Blue',
    position => 'Captain',
);
my %mrhowell_info = (
    name     => 'Mr. Howell',
    hat      => 'Violet',
    shirt    => 'Green',
    position => 'Passenger',
);
my %mrshowell_info = (
    name     => 'Mrs. Howell',
    hat      => 'Pink',
    shirt    => 'Cyan',
    position => 'Passenger',
);

my @crew = (\%gilligan_info, \%skipper_info, \%mrhowell_info, \%mrshowell_info);

foreach my $person (@crew) {
    if ( $person->{name} =~ /Howell/ ) {
        $person->{location} = 'The Island Country Club';
    }
    else {
        $person->{location} = 'The Island';
    }

    print "$person->{name} at $person->{location}\n";
}
