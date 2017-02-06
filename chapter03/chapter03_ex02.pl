#!C:\strawberry\perl\bin\perl.exe

# Ask user to enter a regex (on STDIN); report a list of files in some
# hardcoded directory such as C:\Windows whose names match the pattern; repeat
# until the user enters an empty string. Handle incorrect patterns.

use 5.020;
use warnings;

chdir 'C:\Windows';

while (1) {
    print 'Enter pattern to match files in C:\Windows: ';
    chomp( my $pattern = <STDIN> );
    last if $pattern eq '';

    foreach my $fname ( glob '* .*' ) {
        eval { say $fname if $fname =~ /$pattern/ };
    }
    say "Faulty pattern!" if ($@);
}


# With grep and map:
# say
#     map { "    $_" }
#     grep { eval { /$pattern/ } }
#     glob '* .*';
