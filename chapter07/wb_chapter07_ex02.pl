#!C:\strawberry\perl\bin\perl.exe

# Match line that contains 'a', 'b' and 'c', in that order; any number of
# characters between

print "Enter string: ";
while (<STDIN>) {
    chomp;
    if ( /a.*b.*c/ ) {  # does not match newlines, use /s flag or [\d\D]*
        print "Match!\n";
    }
    else {
        print "No match\n";
    }
}
