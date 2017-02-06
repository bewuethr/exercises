#!C:\strawberry\perl\bin\perl.exe

# Test program from the "Whirlwind Tour"

@lines = `perldoc -u -f atan2`;
foreach (@lines) {
    s/\w<([^>]+)>/\U$1/g;
    print;
}
