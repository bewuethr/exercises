#!C:\strawberry\perl\bin\perl.exe

# Rewrite the previous program using IPC::System::Simple instead of backticks

use 5.020;
use warnings;
use IPC::System::Simple qw(capturex);

chdir('C:\Users');

my ( %users, %groups );

foreach ( capturex 'ls', '-l' ) {
    next if /\Atotal/;
    my ( undef, undef, $user, $group ) = split;
    $users{$user} = 1;
    $groups{$group} = 1;
}

my @users = sort keys %users;
my @groups = sort keys %groups;
say "Users: @users";
say "Groups: @groups";
