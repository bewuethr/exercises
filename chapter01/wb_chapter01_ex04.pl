#!C:\strawberry\perl\bin\perl.exe

# Test backtick operator

@dirs = `ls`;
foreach (@dirs) {
    print;
}
