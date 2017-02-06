#!C:\strawberry\perl\bin\perl.exe

# Rewrite wb_ch08_ex01 and wb_ch08_ex05 with the Chapter 9 knowledge

use 5.020;
use warnings;

my %names = (
    '$' => 'a scalar',
    '@' => 'an array',
    '%' => 'a hash',
);

while (<>) {
    chomp;
    if (/[abx]/i) { # was already optimized
        print "Matched: |$`<$&>$'|\n";
    }
    else {
        print "No first match: |$_|\n";
    }
    if (/
        ([\$\@%])          # match begins with $, @ or %
        \p{XID_Start}      # first character of identifier must be letter or underscore
        \p{XID_Continue}*  # can be followed by zero or more characters
        \b                 # match until end of identifier
    /x) {
        print "Matched: |$`<$&>$'| ($names{$1})\n";
    }
    else {
        print "Contains no variable name: |$_|\n";
    }
}
