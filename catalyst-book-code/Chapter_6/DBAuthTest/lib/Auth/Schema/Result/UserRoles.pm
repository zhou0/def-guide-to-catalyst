package Auth::Schema::Result::UserRoles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "Core");
__PACKAGE__->table("user_roles");
__PACKAGE__->add_columns(
  "user_id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "role_id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("user_id", "role_id");
__PACKAGE__->belongs_to("user_id", "Auth::Schema::Result::Users", { id => "user_id" });
__PACKAGE__->belongs_to("role_id", "Auth::Schema::Result::Roles", { id => "role_id" });


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-10 22:48:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Rr/GY31TIFNsfipoNIPsog

__PACKAGE__->many_to_many('roles', 'user_roles', 'role');

# You can replace this text with custom content, and it will be preserved on regeneration
1;
