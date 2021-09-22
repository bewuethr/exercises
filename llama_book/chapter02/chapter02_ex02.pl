#!C:\strawberry\perl\bin\perl.exe

# Modify previous program to prompt for radius

print "Please enter radius: ";
chomp($r = <STDIN>);
$c = 2 * 3.14159 * $r;
print "The circumference of a circle with radius $r is $c.\n";
