#!C:\strawberry\perl\bin\perl.exe

# Modify the program from exercise 1 to use JSON instead of Storable

use 5.020;
use warnings;
use JSON;

my $tb_ref;
my $fname = 'running_totals.json';

if ( -e $fname ) {
    local $/;
    open my $fh, '<', $fname or die "Can't open $fname: $!";
    my $json_string = <$fh>;
    $tb_ref = decode_json($json_string);
}

while (<>) {
    my ($source, $destination, $bytes)  = split;
    $tb_ref->{$source}[0]               += $bytes;
    $tb_ref->{$source}[1]{$destination} += $bytes;
}

{
    open my $fh, '>', $fname or die "Can't open $fname: $!";
    print $fh to_json( $tb_ref, { pretty => 1 } );
}

foreach my $source (
    sort { $tb_ref->{$b}[0] <=> $tb_ref->{$a}[0] } keys %$tb_ref
) {
    my $tb = $tb_ref->{$source};
    print "$source total: $tb->[0]\n";
    foreach my $destination (
        sort { $tb->[1]{$b} <=> $tb->[1]{$a} }
        keys %{ $tb_ref->{$source}[1] }
    ) {
        print "$source => $destination:",
        " $tb->[1]{$destination} bytes \n";
    }
    print "\n";
}
