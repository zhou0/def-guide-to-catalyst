package Auth::Schema::Result::Users;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "Core");
__PACKAGE__->table("users");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "username",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "email",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "password",
  { data_type => "TEXT", is_nullable => 0, size => undef },
  "last_modified",
  { data_type => "DATETIME", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("username_unique", ["username"]);
__PACKAGE__->has_many(
  "user_roles",
  "Auth::Schema::Result::UserRoles",
  { "foreign.user_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-10 22:48:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LVRIzz78dJYBCgplW/WrLg

  __PACKAGE__->add_columns('last_modified',
     { %{__PACKAGE__->column_info('last_modified')}, 
     set_on_create => 1,
     set_on_update => 1 
   });

  use Email::Valid;
  sub new {
    my ($class, $args) = @_;

    if( exists $args->{email} 
        && !Email::Valid->address($args->{email}) ) {
        die 'Email invalid';
    }

    return $class->next::method($args);
  }


# You can replace this text with custom content, and it will be preserved on regeneration
1;
