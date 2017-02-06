#!C:\strawberry\perl\bin\perl.exe

# Use while and shift to print squares and cubes of numbers in a list @numbers

@numbers = 1..10;
while( $num = shift(@numbers) ) {
    print "Number: $num square: ", $num**2, ' cube: ', $num**3, "\n";
}
