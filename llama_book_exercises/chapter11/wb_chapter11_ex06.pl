#!C:\strawberry\perl\bin\perl.exe

# Use DBD::SQLite to create a table named "Characters" with columns for ID,
# First Name and Last Name; insert names of Flintstone characters
#
# SQLite commands:
#
# sqlite3 wb_chapter11_ex06.db   # create DB
# CREATE TABLE flintstones(id INTEGER PRIMARY KEY, first VARCHAR(255), last VARCHAR(255));
# INSERT INTO flintstones VALUES (0, 'Fred', 'Flintstone');
# INSERT INTO flintstones VALUES (1, 'Barney', 'Rubble');
# INSERT INTO flintstones VALUES (2, 'Wilma', 'Flintstone');

use strict;
use warnings;
use DBI;    # use DBD::SQLite not required

my $dbh = DBI->connect( 'dbi:SQLite:dbname=wb_chapter11_ex06.sqlite', '', '',
                        { AutoCommit => 1 } );  # AutoCommit maybe not required

$dbh->do('
    CREATE TABLE flintstones (
        id INTEGER PRIMARY KEY,
        first VARCHAR(255),
        last VARCHAR(255)
    )
');  # nicer: CREATE TABLE IF NOT EXISTS for multiple runs

my @firsts = qw( Fred Barney Wilma );
my @lasts = qw( Flintstone Rubble Flintstone ); # nicer: as a hash

my $sth = $dbh->prepare( "INSERT INTO flintstones VALUES ( ?, ?, ? )" );

foreach my $id ( 0..2 ) {
    $sth->execute( $id, $firsts[$id], $lasts[$id] );
}
$dbh->disconnect;
