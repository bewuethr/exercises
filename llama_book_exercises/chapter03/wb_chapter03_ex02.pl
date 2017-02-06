#!C:\strawberry\perl\bin\perl.exe

# Repeat previous exercise, but don't use an array

print "Enter a few strings:\n";
while ( chomp( $string = <STDIN> ) ) {
    ( $second_last, $last ) = ( $last, $string );
}
print "The second to last string is $second_last.\n";
