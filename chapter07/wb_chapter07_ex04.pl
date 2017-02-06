#!C:\strawberry\perl\bin\perl.exe

# Match line that contains 'a', but no 'b' anywhere after the 'a'
# character between

print "Enter string: ";
while (<STDIN>) {
    chomp;
    if ( /a[^b]*$/ ) {  # or m/a/, then look at $' and check for m/b/
        print "Match!\n";
    }
    else {
        print "No match\n";
    }
}
