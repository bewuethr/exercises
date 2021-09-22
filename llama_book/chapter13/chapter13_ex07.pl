#!C:\strawberry\perl\bin\perl.exe

# Change the previous program to allow a -s switch before other arguments to
# make a soft link instead of a hard link

use 5.020;
use warnings;
use File::Basename;
use File::Spec::Functions;

my $flag;

if ( @ARGV > 2 ) {
    $flag = shift;
    die "Only -s allowed as option\n" if $flag ne '-s';
}

# More elegant:
# my $flag = $ARVG[0] eq '-s';
# shift @ARGV if $flag;

die "Usage: chapter13_ex07.pl [-s] from_name to_name\n" unless @ARGV == 2;
my ( $from, $to ) = @ARGV;

if ( -d $to ) {
    my $basename = basename $from;
    $to = catfile( $to, $basename );
}

if ($flag) {
    say "Now I would do: 'symlink $from, $to or die \"Couldn't symlink $from to $to: \$!\"'";
}
else {
    link $from, $to or die "Couldn't link $from to $to: $!";
}
