#!C:\strawberry\perl\bin\perl.exe

# Print numbers from 1 to 10, separate them with commas

@array = 1..10;
$" = ', ';
print "@array\n";
