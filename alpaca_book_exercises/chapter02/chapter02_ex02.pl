#!C:\strawberry\perl\bin\perl.exe

# Report name and first release date for all the modules in Perl v5.20.2

use 5.020;
use warnings;
no warnings "experimental::autoderef";
use Module::CoreList;
use List::Util qw( max );

my @modules = sort keys $Module::CoreList::version{5.020002};

my $max_length = max map length, @modules;

foreach my $module (@modules) {
    printf "%-${max_length}s %s\n",
        $module,
        $Module::CoreList::released{Module::CoreList::first_release($module)};
}
