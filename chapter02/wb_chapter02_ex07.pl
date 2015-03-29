#!C:\strawberry\perl\bin\perl.exe

# Ask for numbers and add them up

print "Enter first number:\n";
while ( chomp($num = <STDIN>) ) {
    $sum += $num;
    print "Enter another number: ";
}
print "Sum: $sum\n";
