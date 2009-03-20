package TAP::Formatter::RawData::Session;
use strict;
use warnings;
use base qw(TAP::Formatter::Session);

# TAPの各行(TAP::Parser::Result)は、ここに渡って来る
sub result {
	my $self = shift;
	my ( $result ) = @_;

	# save all TAP lines.
	$self->formatter->add_result($self->name, $result);
}

# これは必要っぽい(TAP::Formatter::Session がやるべきな気がする)
sub close_test {
	shift->parser(undef);
}

1;
__END__

=head1 NAME

TAP::Formatter::RawData::Session -

=head1 SYNOPSIS

  use TAP::Formatter::RawData::Session;

=head1 DESCRIPTION

TAP::Formatter::RawData::Session is

=head1 AUTHOR

Masahiro Honma E<lt>hira.tara {at} gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
