#!C:\strawberry\perl\bin\perl.exe

# Take filename from command line; if file exists, print first line, otherwise
# die

my $file = shift @ARGV;
open my $fh, '<', $file
    or die "Could not open $file: $!";

print scalar <$fh>;
