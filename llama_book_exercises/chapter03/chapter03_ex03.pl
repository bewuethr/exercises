#!C:\strawberry\perl\bin\perl.exe

# Read list of strings on separate lines, print string in code point order

chomp(@names = <STDIN>);
@names = sort @names;
print "@names\n";

# print on separate lines: print sort <STDIN>
