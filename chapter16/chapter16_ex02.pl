#!C:\strawberry\perl\bin\perl.exe

# Modify previous program to send output to a file 'ls.out' and error output to
# a file 'ls.err'

use 5.020;
use warnings;
use Cwd;
use File::Spec;

my $dirname = getcwd;
my $out_file = File::Spec->catfile( $dirname, 'ls.out' );
my $err_file = File::Spec->catfile( $dirname, 'ls.err' );

# Alternative: reopen standard file handles
# open STDOUT, '>', 'ls.out' or die "Can't write to ls.out: $!";
# open STDERR, '>', 'ls.err' or die "Can't write to ls.err: $!";
# ...
# !system 'dir' or die "Can't exec dir: $!";

chdir '/' or die "Can't change to root directory: $!";
!system "dir >$out_file 2>$err_file" or die "Can't exec dir: $!";
