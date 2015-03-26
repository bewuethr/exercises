#!C:\strawberry\perl\bin\perl.exe

# Prompt for two numbers and print the product

print "Enter first number: ";
chomp($n1 = <STDIN>);
print "Enter second number: ";
chomp($n2 = <STDIN>);
$prod = $n1 * $n2;
print "The product of $n1 and $n2 is $prod.\n";
