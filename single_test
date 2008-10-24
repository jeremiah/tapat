#!/usr/bin/perl -w

#     Name:          single_test
#     Purpose:       runs a single test

#     TODO: Needs pod, needs database connection, (currently undergoing refactoring 
#     using App::Test::Tapat, which is only local - not yet on CPAN.
#
#    Copyright: 2008 Jeremiah C. Foster
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

use strict;
use diagnostics;
use TAP::Parser qw/all/;
use TAP::Parser::Aggregator qw/all/;
use File::Basename;
use Term::ANSIColor;
use DBI;
use App::Test::Tapat;

my $time_now = `date +"%Y-%m-%d %X"`;
chomp($time_now);
sub update_case {    # Insert test case data into database
  my $dbh = DBI->connect("DBI:mysql:database=test;",
                         "test", "test", {'RaiseError' => 1}) or die "Cannot connect: $!\n";
  my ($tc, $result) = @_;
  $dbh->do("UPDATE test_cases
            SET last_run = NOW(), result = '$result'
            WHERE tc_id = '$tc' ");
  $dbh->disconnect;
}

my $planned = 0;
my $aggregate = TAP::Parser::Aggregator->new;
foreach my $file (@ARGV) {
  my $test = fileparse($file);
  my ($script, $test_id) = split /_/, $test;
  print "Running $test at $time_now with test id: $test_id\n";

  # Create parser object
  my $parser = TAP::Parser->new( { source => $file } );
  $aggregate->start();            # start timer
  $aggregate->add($file, $parser);

  while ( my $result = $parser->next ) {
    my $out = $result->as_string;
    print "$out\n";
    if ($result->is_plan) {
      $planned = $result->tests_planned;
    }
  }
  $aggregate->stop();             # stop timer

  my $elapsed = $aggregate->elapsed_timestr();
  my $failed = $parser->failed;
  my $passed = $parser->passed;

  # If we ran all the tests, and they all passed
  if ($parser->is_good_plan && ($passed - $failed == $planned)) {
    print color 'green'; 
    print "\n--==[ Passed all our planned tests, updating db for $test_id ]==--\n";
#    &update_case($test_id, "pass");
  } else {
    print color 'red';
    print "\n--==[ ERROR in testing output. ]==--\n";
#    &update_case($test_id, "fail");
  }
  print "Elapsed time: $elapsed\nPassed: $passed\nFailed: $failed\n---\n";
  print color 'reset';
}


1;
