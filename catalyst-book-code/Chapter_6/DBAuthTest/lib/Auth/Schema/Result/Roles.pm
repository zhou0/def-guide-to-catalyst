package Auth::Schema::Result::Roles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "Core");
__PACKAGE__->table("roles");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INTEGER", is_nullable => 0, size => undef },
  "role",
  { data_type => "TEXT", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("role_unique", ["role"]);
__PACKAGE__->has_many(
  "user_roles",
  "Auth::Schema::Result::UserRoles",
  { "foreign.role_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-05-10 22:48:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UGByny/ZT+03kcrpcQQPfg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
