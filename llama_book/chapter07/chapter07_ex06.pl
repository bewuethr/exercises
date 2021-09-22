#!C:\strawberry\perl\bin\perl.exe

# Match lines that mention both wilma and fred

use 5.020;
use warnings;

while (<>) {
    if (/wilma.*fred|fred.*wilma/) {
        print;
    }
}

# Alternative:
# if (/wilma/) {
#     if (/fred/) {
#         print
#     }
# }
