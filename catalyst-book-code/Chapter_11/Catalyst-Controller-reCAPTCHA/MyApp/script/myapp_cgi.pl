#!/usr/bin/perl -w
use warnings;
use strict;

BEGIN { $ENV{CATALYST_ENGINE} ||= 'CGI' }

use FindBin;
use lib "$FindBin::Bin/../lib";
use MyApp;

MyApp->run;

1;

=head1 NAME

myapp_cgi.pl - Catalyst CGI

=head1 SYNOPSIS

See L<Catalyst::Manual>

=head1 DESCRIPTION

Run a Catalyst application as a cgi script.

=head1 AUTHORS

Catalyst Contributors, see Catalyst.pm

=head1 COPYRIGHT


This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
