#!C:\strawberry\perl\bin\perl.exe
use warnings;

# Prompt for code points and print characters (run with -CS switch)
# Powershell has no glyphs to display the proper unicode characters

print 'Enter first code point: ';
while( chomp($cp = <STDIN>) ) {
    print 'The character is ', chr( hex( $cp ) ), ".\n";
    print 'Enter next code point: '
}
