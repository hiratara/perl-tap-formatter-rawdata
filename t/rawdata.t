use strict;
use warnings;
use Test::More tests => 9;
use TAP::Harness;
use TAP::Formatter::RawData;

# run tests with Formatter::RawData
my $formatter = TAP::Formatter::RawData->new;
my $harness = TAP::Harness->new({
	formatter => $formatter,
	merge     => 1,  # if you want to record comments.
});

$harness->runtests('t/sampletests/basic');


# result objects(each TAP lines) recoded.
my $record     = $formatter->record;
my $aggregator = $record->aggregator;
isa_ok($aggregator, 'TAP::Parser::Aggregator', 'You can get the aggregator.');

# check the aggregator
my @testnames = $aggregator->descriptions;
is(scalar @testnames, 1, "ran 1 test.");
is($testnames[0], 't/sampletests/basic');

my @tap_results = $record->results($testnames[0]);
is(scalar @tap_results, 5, 'TAP contains 5 lines.');

ok($tap_results[0]->is_plan, 'first line is plan');
ok($tap_results[1]->is_ok, 'second line is ok');
ok(! $tap_results[2]->is_ok, 'third line is not ok');
ok($tap_results[3]->is_comment, 'forth line is comment');
ok($tap_results[4]->is_ok, 'fifth line is ok');
