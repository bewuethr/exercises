#!C:\strawberry\perl\bin\perl.exe

# Modify previous program to stop reading if encountering __END__

use 5.020;
use warnings;

my $counter = 0;
while (<>) {
    next if /\A\s*(?:#|\z)/;
    $counter++;
    last if /\A__END__\Z/;
}
print "The program has $counter lines.\n";

__END__
Don't count this!
