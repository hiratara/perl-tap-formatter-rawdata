package TAP::Formatter::RawData::Record;
use strict;
use warnings;
use base qw(TAP::Object);

__PACKAGE__->mk_methods(qw/aggregator _results/);

sub _initialize{
	my $self = shift;
	$self->SUPER::_initialize(@_);
	$self->_results( {} );
	return $self;
}

sub results{
	my $self = shift;
	my ( $name ) = @_;
	return @{ $self->_results->{$name} };
}

sub add_result{
	my $self = shift;
	my ($name, $result) = @_;
	push @{ $self->_results->{$name} }, $result;
}

1;
__END__

=head1 NAME

TAP::Formatter::RawData::Record -

=head1 SYNOPSIS

  use TAP::Formatter::RawData::Record;

=head1 DESCRIPTION

TAP::Formatter::RawData::Record is

=head1 AUTHOR

Masahiro Honma E<lt>hira.tara {at} gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
