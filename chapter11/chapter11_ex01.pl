#!C:\strawberry\perl\bin\perl.exe

# Print a list of all modules that came with Perl

use strict;
use warnings;
use Module::CoreList;

my %modules = %{ $Module::CoreList::version{5.020} };

foreach my $module ( sort keys %modules ) {
    printf "%-43s %s\n", $module, $modules{$module} // "(undefined)";
}

# To print just names: print join "\n", keys %modules;
