#!C:\strawberry\perl\bin\perl.exe

# Modify previous program to report circumference of zero for negative radii

print "Please enter radius: ";
chomp($r = <STDIN>);
if ($r < 0) {
    $c = 0;
} else {
    $c = 2 * 3.14159 * $r;
}
print "The circumference of a circle with radius $r is $c.\n";
