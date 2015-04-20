#!C:\strawberry\perl\bin\perl.exe

# Change to a hardcoded directory, e.g., the root directory, then execute the
# ls -l command (or the corresponding one)

use 5.020;
use warnings;

chdir '/' or die "Can't change to root directory: $!";
!system 'dir' or die "Can't exec dir: $!";
