#!C:\strawberry\perl\bin\perl.exe

# Read the logfile and, in one pass, write to a series of files, each named
# name.info where 'name' is the name of the castaway of the line being written
# to the logfile.

use 5.020;
use warnings;

my %handles;

foreach my $line (<>) {
    my($name) = ( $line =~ /\A(.*):/ );                 # part before colon
    $name = join '', ( split /(?:\. |-)/, "\L$name" );  # lc and interpunction
    unless ( defined $handles{$name} ) {
        open my $fh, '>', "$name.info" or die "Can't open $name.info: $!\n";
        $handles{$name} = $fh;
    }
    print { $handles{$name} } $line;
}
