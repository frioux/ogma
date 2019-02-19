#!/usr/bin/perl

use strict;
use warnings;

use autodie ':all';

no warnings 'uninitialized';

use DBI;
my $dbh = DBI->connect('dbi:SQLite:/home/frew/books.db', {
      RaiseError => 1,
});

my $sth = $dbh->prepare('INSERT INTO booksearch (fulltext) VALUES (?)');

$dbh->begin_work;
for my $doc (@ARGV) {
   open my $fh, "<", $doc;

   $sth->execute(do { local $/; <$fh>});
   print scalar localtime ." Inserted $doc\n";
}
$dbh->commit;
