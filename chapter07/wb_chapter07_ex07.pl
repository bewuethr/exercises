#!C:\strawberry\perl\bin\perl.exe

# Use Unicode properties to match lines that have numbers or whitespace.

print "Enter string: ";
while (<STDIN>) {
    chomp;
    if ( /\p{Number}/ ) { 
        print "Matched Unicode number property.\n";
    }
    if ( /\p{Space}/ ) {
        print "Matched Unicode whitespace property.\n";
    }
    if ( ! /\p{Number}|\p{Space}/ ) {
        print "No match\n";
    }
    print "Enter string: ";
}
