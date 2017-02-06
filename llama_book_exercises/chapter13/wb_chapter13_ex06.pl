#!C:\strawberry\perl\bin\perl.exe

# Rewrite the previous program to use glob and foreach

use 5.020;
use warnings;

printf "%-30s %10s\n", 'Name', 'Size';
say '-' x 41;

foreach my $file ( glob '* .*' ) {
    next if -d $file;
    open my $fh, '<', $file or next;
    my $line = <$fh>;
    next unless $line =~ /\A#!.*perl.*/;
    printf "%-30s %10d\n", $file, -s $file;
    close $fh;
}
