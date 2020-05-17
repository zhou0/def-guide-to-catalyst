package DBAuthTest::Model::AuthDB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'Auth::Schema',
    connect_info => [
        'dbi:SQLite:db/auth.db',
        
    ],
);

=head1 NAME

DBAuthTest::Model::AuthDB - Catalyst DBIC Schema Model
=head1 SYNOPSIS

See L<DBAuthTest>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<Auth::Schema>

=head1 AUTHOR

Kieren Diment

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
