#!C:\strawberry\perl\bin\perl.exe

# Modify the program from exercise 2 to execute the command using open and a
# pipe; read the input one line at a time through a filehandle and report the
# same results

use 5.020;
use warnings;

chdir('C:\Users');

# open my $ls_fh, '-|', 'ls', '-l' or die "cannot pipe from ls: $!";
open my $ls_fh, 'ls -l |';  # because list form of pipe open is not implemented

my ( %users, %groups );

while ( my $line = <$ls_fh> ) {
    next if $line =~ /\Atotal/;
    my ( undef, undef, $user, $group ) = split " ", $line;
    $users{$user} = 1;
    $groups{$group} = 1;
}

close $ls_fh;
die "ls: non-zero exit of $?" if $?;

my @users = sort keys %users;
my @groups = sort keys %groups;

say "Users: @users";
say "Groups: @groups";
