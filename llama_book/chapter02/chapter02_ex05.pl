#!C:\strawberry\perl\bin\perl.exe

# Prompt for string and number (on separate lines) and print out the string the
# number of times indicated by the number on separate lines

print "Enter a string: ";
$s = <STDIN>;
print "Enter a number: ";
chomp($n = <STDIN>);
print $s x $n;
