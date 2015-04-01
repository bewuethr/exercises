#!C:\strawberry\perl\bin\perl.exe

# Match line that contains a sequence of at least three characters that repeats
# itself, interwoven with another sequence that repeats itself. Use relative
# backreferences.

print "Enter string: ";
while (<STDIN>) {
    chomp;
    if ( /(...+).*(...+).*\g{-2}.*\g{-1}/ ) { 
        print "Match!\n";
    }
    else {
        print "No match\n";
    }
    print "Enter string: ";
}
