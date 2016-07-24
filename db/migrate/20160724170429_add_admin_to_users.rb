class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, degault: true
  end
end
