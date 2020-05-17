package DBAuthTest::Controller::AuthUsers;

use strict;
use warnings;
use parent 'Catalyst::Controller';


  sub base : Chained('/'): PathPart('authusers'): CaptureArgs(0) {
    my ($self, $c) = @_;

    $c->stash(users_rs => $c->model('AuthDB::Users'));
  }

  sub add : Chained('base'): PathPart('add'): Args(0) {
    my ($self, $c) = @_;

    if(lc $c->req->method eq 'post') {
      my $params = $c->req->params;

      ## Retrieve the users_rs stashed by the base action:
      my $users_rs = $c->stash->{users_rs};

      ## Create the user:
      my $newuser = $users_rs->create({
        username => $params->{username},
        email    => $params->{email},
        password => $params->{password},
    });
      return $c->res->redirect( $c->uri_for(
          $c->controller('AuthUser')->action_for('profile'), 
          [ $newuser->id ]
      ) );

    }

}

  sub user : Chained('base'): PathPart(''): CaptureArgs(1) {
      my ($self, $c, $userid) = @_;
      
      my $user = $c->stash->{users_rs}->find({ id => $userid },
                                             { key => 'primary' });
      
      die "No such user" if(!$user);
      
      $c->stash(user => $user);
  }

    sub profile : Chained('user') :PathPart('profile'): Args(0) {
    my ($self, $c) = @_;

  }




1;
