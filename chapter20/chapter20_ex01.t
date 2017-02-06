#!C:\Strawberry\perl\bin\perl.exe

# Use the Test::File module to check for the existence and readability of the
# /etc/hosts file on Unix and the C:\Windows\System32\drivers\etc\hosts file on
# Windows. Skip for the platform you're not on by inspecting the value of $^O.

use strict;
use warnings;
use Test::More;
use Test::File;

diag("Hosts file test, Perl $], $^X");

SKIP: {
    skip 'We are not running Windows', 2
        unless $^O eq 'MSWin32';
     
    my $file = 'C:\\Windows\\System32\\drivers\\etc\\hosts';
    file_exists_ok  ($file);
    file_readable_ok($file);
}

SKIP: {
    skip 'We are not running Linux', 2
        unless $^O eq 'linux';
     
    my $file = '/etc/hosts';
    file_exists_ok  ($file);
    file_readable_ok($file);
}

done_testing();
