#!C:\strawberry\perl\bin\perl.exe

# Read list of strings from file, let user enter patterns; for each pattern,
# the program should tell how many strings from the file matched, then which
# ones those were. If a pattern is invalid, report that error and continue.
# When the user enters a blank line, quit

use 5.020;
use warnings;

open my $fh, '<', 'sample_text.txt' or die "Can't open sample_text.txt: $!";
my @lines = <$fh>;
close $fh;

say "Enter patterns to search for in example text:";

while ( my $pattern = <STDIN> ) {
    chomp $pattern;
    last if $pattern =~ /\A\s*\z/;
    my @matching_lines = eval { grep /$pattern/, @lines };
    if ($@) {
        print "Something is wrong with that regex, try again: $@";
        next;
    }
    my $line_count = @matching_lines;

    if ($line_count) {
        say "\nMatched $line_count lines:";
        print @matching_lines;
    }
    else {
        say "\nNo match!";
    }
}
