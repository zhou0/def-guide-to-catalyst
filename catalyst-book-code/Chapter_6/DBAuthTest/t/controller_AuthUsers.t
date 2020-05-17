use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'DBAuthTest' }
BEGIN { use_ok 'DBAuthTest::Controller::AuthUsers' }

my $req = request('/authusers/add');
ok( $req->is_success, 'Request should succeed' );


