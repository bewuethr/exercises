#!C:\strawberry\perl\bin\perl.exe

# Modify the iterative version of data_for_path to handle both depth-first and
# breadth-first traversal. Use an optional third argument to allow the user to
# decide with to use ('depth-first' or 'breadth-first').

use 5.020;
use warnings;
use File::Basename;
use File::Spec::Functions;

sub data_for_path {
    my($path, $threshold, $method) = @_;

    my $data = {};

    my @queue = ([$path, 0, $data]);

    while (my $next = shift @queue) {
        my($path, $level, $ref) = @$next;
        my $basename = basename($path);

        $ref->{$basename} = do {
            if(-f $path or -l $path) { undef }
            else {
                my $hash = {};
                if ($method eq 'depth-first'
                        or $method eq 'breadth-first' and $level < $threshold) {
                    opendir my($dh), $path;
                    my @new_paths = map {
                        catfile($path, $_)
                    } grep { ! /^\.\.?\z/ } readdir $dh;

                    unshift @queue, map { [$_, $level, $hash] } @new_paths
                        if $method eq 'depth-first';
                    push @queue, map { [$_, $level + 1, $hash] } @new_paths
                        if $method eq 'breadth-first';
                }

                $hash;
            }
        };
    }
    $data;
}

sub dump_data_for_path {
    my $path = shift;
    my $data = shift;
    my $indent_level = shift // 0;
    my $indent = '  ' x $indent_level;

    print $indent, $path; 

    if (not defined $data) {    # plain file
        print "\n";
        return;
    }

    if (%$data) {
        print ", with contents:\n";
        foreach (sort keys %$data) {
            dump_data_for_path($_, $data->{$_}, $indent_level + 1);
        }
    } else {
        print ", an empty directory\n";
    }
}

chdir '..';
my $threshold = 3;
my $depth   = data_for_path('.', $threshold, 'depth-first');
my $breadth = data_for_path('.', $threshold, 'breadth-first');

say 'Data from depth-first:';
dump_data_for_path('.', $depth);
say "\n\nData from breadth-first:";
dump_data_for_path('.', $breadth);
