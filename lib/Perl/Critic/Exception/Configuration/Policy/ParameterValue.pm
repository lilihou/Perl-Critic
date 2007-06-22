##############################################################################
#      $URL$
#     $Date$
#   $Author$
# $Revision$
##############################################################################

package Perl::Critic::Exception::Configuration::Policy::ParameterValue;

use strict;
use warnings;

use Perl::Critic::Utils qw{ :characters &policy_short_name };

our $VERSION = 1.06;

#-----------------------------------------------------------------------------

use Exception::Class (
    'Perl::Critic::Exception::Configuration::Policy::ParameterValue' => {
        isa         => 'Perl::Critic::Exception::Configuration::Policy',
        description => 'A problem with the value of a parameter for a policy.',
        fields      => [ qw{ policy } ],
    },
);

#-----------------------------------------------------------------------------

sub full_message {
    my ( $self ) = @_;

    my $source = $self->source();
    if ($source) {
        $source = qq{ found in "$source"};
    }
    else {
        $source = $EMPTY;
    }

    my $policy = $self->policy();
    my $option_name = $self->option_name();
    my $option_value =
        defined $self->option_value()
            ? $DQUOTE . $self->option_value() . $DQUOTE
            : '<undef>';
    my $message_suffix = $self->message_suffix() || $EMPTY;

    return
            qq{The value for the $policy "$option_name" option }
        .   qq{($option_value)$source $message_suffix};
}


1;

__END__

#-----------------------------------------------------------------------------

=pod

=for stopwords

=head1 NAME

Perl::Critic::Exception::Configuration::Policy::ParameterValue - A problem with the value of a parameter for a policy

=head1 DESCRIPTION

A representation of a problem found with the value of a parameter for a
L<Perl::Critic::Policy>, whether from a F<.perlcriticrc>, another
profile file, or command line.


=head1 CLASS METHODS

=over

=item C<< throw( policy => $policy, option_name => $option_name, option_value => $option_value, source => $source, message_suffix => $message_suffix ) >>

See L<Exception::Class/"throw">.


=item C<< new( policy => $policy, option_name => $option_name, option_value => $option_value, source => $source, message_suffix => $message_suffix ) >>

See L<Exception::Class/"new">.


=back


=head1 METHODS

=over

=item C<full_message()>

Provide a standard message for policy parameter value problems.  See
L<Exception::Class/"full_message">.


=back


=head1 AUTHOR

Elliot Shank <perl@galumph.com>

=head1 COPYRIGHT

Copyright (c) 2007 Elliot Shank.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.  The full text of this license
can be found in the LICENSE file included with this module.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 78
#   indent-tabs-mode: nil
#   c-indentation-style: bsd
# End:
# ex: set ts=8 sts=4 sw=4 tw=78 ft=perl expandtab :