#!C:\strawberry\perl\bin\perl.exe

# Look in current directory, then list Perl programs with their size. Use
# opendir.

use 5.020;
use warnings;

opendir my $dh, '.' or die "Can't open current directory: $!";
printf "%-30s %10s\n", 'Name', 'Size';
say '-' x 41;
while ( my $file = readdir $dh ) {
    next if -d $file;
    open my $fh, '<', $file or next;
    my $line = <$fh>;
    if ( $line =~ /\A#!.*perl.*/ ) {
        printf "%-30s %10d\n", $file, -s $file;
    }
    close $fh;
}
closedir $dh;
