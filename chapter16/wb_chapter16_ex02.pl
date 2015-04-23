#!C:\strawberry\perl\bin\perl.exe

# Use the backticks operator to read the output of the 'dir' command, then
# report which users and groups it finds. Run it in the directory that contains
# the user home directories

use 5.020;
use warnings;

chdir('C:\Users');
my @listing = `ls -l`;

my ( %users, %groups );

foreach my $line (@listing) {   # simpler: foreach ( `ls -l` )
    $line =~ /\A\S+\s+\d+\s+(\S+)\s+(\S+)/; # simpler: my ( undef, undef, $user, $group ) = split;
    if ( defined $1 and defined $2 ) {  # simpler: start with next if /\Atotal/;
        $users{$1} = 1;
        $groups{$2} = 1;
    }
}

my @users = sort keys %users;
my @groups = sort keys %groups;

say "Users: @users";
say "Groups: @groups";
