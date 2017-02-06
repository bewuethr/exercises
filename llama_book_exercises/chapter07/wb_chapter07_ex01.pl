#!C:\strawberry\perl\bin\perl.exe

# Match either fred or barney, then report part of string before the match,
# after the match and the match itself

print "Enter string: ";
while (<STDIN>) {
    chomp;
    if ( /fred|barney/ ) {
        print "Match: $&\n";        # alternative: ${^MATCH}
        print "Before match: $`\n"; # alternative: ${^PREMATCH}
        print "After match: $'\n";  # alternative: ${^POSTMATCH}
    }
    else {
        print "No match\n";
    }
}
