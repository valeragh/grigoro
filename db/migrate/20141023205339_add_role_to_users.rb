class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string

    User.create! do |u|
      u.email    = 'admin@test.org'
      u.password = 'admin123'
      u.role     = 'admin'
    end
  end
end
