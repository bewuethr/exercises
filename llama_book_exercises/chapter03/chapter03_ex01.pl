#!C:\strawberry\perl\bin\perl.exe -w

# Read list of strings on separate lines until end of input, print in
# reverse order

@lines = <STDIN>;
@lines = reverse @lines;
print @lines;

# simpler: print reverse <STDIN>;
