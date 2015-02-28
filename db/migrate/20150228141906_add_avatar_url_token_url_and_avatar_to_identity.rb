class AddAvatarUrlTokenUrlAndAvatarToIdentity < ActiveRecord::Migration
  def change
    add_column :identities, :token, :string
    add_column :identities, :url, :string
    add_column :identities, :avatar, :string
  end
end
