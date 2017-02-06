#!C:\strawberry\perl\bin\perl.exe

# Write subroutine which, given a starting and an ending timestamp, returns a
# pair of coderefs. The first one will be used with File::Find to gather the
# names of only the items that were modified between those two times; the
# second one you can use to get the list of items found.

use 5.020;
use warnings;
use utf8;

use File::Find;
use Time::Local;

sub gather_mtime_between {
    my($start, $stop) = @_;

    my @files = ( );

    return (
        sub {
            my $timestamp = (stat $_)[9];
            unless (defined $timestamp) {
                warn "Can't stat $File::Find::name: $!, skipping\n";
                return;
            }
            push @files, $File::Find::name
                if $timestamp >= $start and $timestamp <= $stop;
        },
        sub {
            @files
        } 
    );
}

my $target_dow = 1; # Sunday is 0, Monday is 1, ...
my @starting_directories = (".");

my $seconds_per_day = 24 * 60 * 60;
my($sec, $min, $hour, $day, $mon, $yr, $dow) = localtime;
my $start = timelocal(0, 0, 0, $day, $mon, $yr);    # midnight today

while ($dow != $target_dow) {
    # Back up one day
    $start -= $seconds_per_day; # hope no DST! :-)
    if (--$dow < 0) {
        $dow += 7;
    }
}
my $stop = $start + $seconds_per_day;

my($gather, $yield) = gather_mtime_between($start, $stop);
find($gather, @starting_directories);
my @files = $yield->( );

for my $file (@files) {
    my $mtime = (stat $file)[9];    # mtime via slice
    my $when = localtime $mtime;
    print "$when: $file\n";
}
