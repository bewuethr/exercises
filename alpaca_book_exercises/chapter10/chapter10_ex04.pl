#!C:\strawberry\perl\bin\perl.exe

# Modify the recursive directory dumping routine so it shows nested directories
# through indentation.

use 5.020;
use warnings;
use File::Spec qw(catfile);

sub data_for_path {
    my $path = shift;
    if (-f $path or -l $path) { # files or symlinks
        return undef;
    }

    if (-d $path) {
        my %directory;
        opendir my $dh, $path or die "Cannot opendir $path: $!";
        my @names = readdir $dh;
        closedir $dh;

        foreach my $name (@names) {
            next if $name eq '.' or $name eq '..';
            $directory{$name} = data_for_path(File::Spec->catfile($path, $name));
        }
        return \%directory;
    }
    warn "$path is neither a file nor a directory\n";
    return undef;
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
dump_data_for_path('.', data_for_path('.'));
