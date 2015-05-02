#!C:\strawberry\perl\bin\perl.exe

# Complete the given program, create the hash using a hash slice, then change
# it to create the hash using a map

use 5.020;
use warnings;

my @names  = qw( Fred Barney Dino );
my @scores = qw( 230  190    30   );

my %scores;
@scores{@names} = @scores;

foreach my $name ( sort keys %scores ) {
    print "$name has score $scores{$name}\n";
}

my %map_scores = map { ( $names[$_], $scores[$_] ) } 0 .. $#names;
foreach my $name ( sort keys %map_scores ) {
    print "$name has score $map_scores{$name}\n";
}
