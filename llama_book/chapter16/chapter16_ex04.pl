#!C:\strawberry\perl\bin\perl.exe

# (Won't work properly under Windows) Write an infinite loop program that
# catches signals and reports which signal it caught and how many times it's
# caught that signal before. Exit if you catch the INT signal.

use 5.020;
use warnings;

my %sig_count;

sub my_hup_handler  { say 'Caught HUP: ', ++$sig_count{hup} }
sub my_usr1_handler { say 'Caught USR1: ', ++$sig_count{usr1} }
sub my_usr2_handler { say 'Caught USR2: ', ++$sig_count{usr2} }
sub my_int_handler  { say 'Caught INT, exiting'; exit }

# Set signal handlers
foreach my $signal ( qw( hup usr1 usr2 int ) ) {
    $SIG{ uc $signal } = "my_${signal}_handler";
}

say "I am $$";

while (1) {
    sleep 1;
}
