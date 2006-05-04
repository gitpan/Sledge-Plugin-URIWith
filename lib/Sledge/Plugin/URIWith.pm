package Sledge::Plugin::URIWith;
use strict;
use warnings;
our $VERSION = '0.01';

use Carp;
use URI;
use URI::QueryParam;

sub import {
    my $pkg = caller;

    $pkg->add_trigger(
        BEFORE_OUTPUT => sub {
            my $self = shift;
            $self->tmpl->param( uri_with => _gen_uri_with($self) );
        }
    );
}

sub _gen_uri_with {
    my $self = shift;

    return sub {
        my $args = shift;
        carp('No arguments passed to uri_with()') unless $args;

        my $uri = URI->new( $self->current_url );
        $uri->query_form( { %{ $uri->query_form_hash }, %$args } );
        return $uri;
    };
}

1;
__END__

=head1 NAME

Sledge::Plugin::URIWith - uri_with helper for Sledge

=head1 SYNOPSIS

  # in your pages class
  package Your::Pages;
  use Sledge::Plugin::URIWith;

  # in your template
  [% uri_for(page => 3) %]

  # if current page's uri is:
  # http://example.jp/?page=2&keyword=hoge
  # output as:
  # http://example.jp/?page=3&keyword=hoge

=head1 DESCRIPTION

Sledge::Plugin::URIWith is uri_with helper for Sledge.

This plugin is useful for paging.

=head1 AUTHOR

MATSUNO Tokuhiro E<lt>tokuhiro at mobilefactory.jpE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Bundle::Sledge>

=cut
