#!C:\strawberry\perl\bin\perl.exe

# Modify the RaceHorse class to get the previous standings from persistent
# storage (JSON, DBM, Storable) when the horse is created, and update the
# standings when the horse is destroyed.

use strict;
use warnings;
use feature qw(say);
use Horse;
use RaceHorse;

my $racer = RaceHorse->named('Billy Boy');

# Test basic functionalities
say 'Name: ', $racer->name;
$racer->speak;
$racer->eat('hay');
say 'Color: ', $racer->color;

$racer->won;
$racer->won;
$racer->won;
$racer->showed;
$racer->lost;
print $racer->name, ' has standings of: ', $racer->standings, ".\n";
