#!C:\strawberry\perl\bin\perl.exe

# Read list of numbers on separate lines, print for each number name from hard
# coded list

@names = qw( fred betty barney dino wilma pebbles bamm-bamm );
chomp(@numbers = <STDIN>);
foreach (@numbers) {
    print "$_: @names[$_-1]\n";
}
