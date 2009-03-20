package TAP::Formatter::RawData;

use strict;
use warnings;
use base qw(TAP::Formatter::Base);

use TAP::Formatter::RawData::Session;
use TAP::Formatter::RawData::Record;

our $VERSION = '0.01';

BEGIN {
	__PACKAGE__->mk_methods('record');
}

sub _initialize{
	my $self = shift;
	$self->SUPER::_initialize(@_);
	$self->record( TAP::Formatter::RawData::Record->new );
	return $self;
}


sub open_test{
	my $self = shift;
	my ( $test, $parser ) = @_;

	# make session for a test file.
	my $session = TAP::Formatter::RawData::Session->new({
		name      => $test,
		formatter => $self,
		parser    => $parser,
	});

	return $session;
}

# don't print summary into stdout
sub summary{
	my $self = shift;
	my ( $aggregator ) = @_;
	$self->record->aggregator( $aggregator );
}

sub add_result{
	my $self = shift;
	my ($name, $result) = @_;

	$self->record->add_result($name, $result);
}


1;
__END__

=head1 NAME

TAP::Formatter::RawData -

=head1 SYNOPSIS

  use TAP::Formatter::RawData;

=head1 DESCRIPTION

TAP::Formatter::RawData is

=head1 AUTHOR

Masahiro Honma E<lt>hira.tara {at} gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
