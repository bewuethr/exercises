#!C:\strawberry\perl\bin\perl.exe

# Use File::Find to traverse the directory, report the mean number of
# directories, files and links per directory. Statistics::Descriptive might
# be useful.

use 5.020;
use warnings;
use File::Find;
use Statistics::Descriptive;

my $stat_files = Statistics::Descriptive::Full->new();
my $stat_dirs  = Statistics::Descriptive::Full->new();
my $stat_links = Statistics::Descriptive::Full->new();

my %files;
my %dirs;
my %links;

find( \&wanted, @ARGV );

sub wanted {
    $files{$File::Find::dir}++;
    if ( -d $_ ) { $dirs{$File::Find::dir}++ }
    if ( -l $_ ) { $links{$File::Find::dir}++ }
}

$stat_files->add_data( values %files );
$stat_dirs->add_data( values %dirs );
$stat_links->add_data( values %links );

say "Mean numbers per directory:";
printf "%g files, %g directories and %g links\n",
    $stat_files->mean(), $stat_dirs->mean(), $stat_links->mean() // 0;
