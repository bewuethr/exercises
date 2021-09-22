#!C:\strawberry\perl\bin\perl.exe

# Read list of files in the current directory, convert names to full path
# specifications. Use File::Spec and Cwd; print each path with four spaces
# before it and a newline after it.

use 5.020;
use warnings;
use File::Spec;
use Cwd;

my $dir = getcwd;

foreach my $file ( glob '.* *' ) {
    say '    ', File::Spec->catfile( $dir, $file );
}
