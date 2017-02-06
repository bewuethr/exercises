#!C:\strawberry\perl\bin\perl.exe

# Match line that contains a sequence of at least three characters that repeats
# itself at some point in the string. Use relative backreferences.

print "Enter string: ";
while (<STDIN>) {
    chomp;
    if ( /(...+).*\g{-1}/ ) { 
        print "Match!\n";
    }
    else {
        print "No match\n";
    }
    print "Enter string: ";
}
