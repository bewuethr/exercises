#!C:\strawberry\perl\bin\perl.exe

# Ask for two numbers, report larger one

print "Enter first number: ";
chomp($num1 = <STDIN>);
print "Enter second number: ";
chomp($num2 = <STDIN>);
print "Of $num1 and $num2, " . ($num1>$num2 ? $num1 : $num2) . " is the bigger number.\n";
