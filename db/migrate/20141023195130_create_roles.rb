class CreateRoles < ActiveRecord::Migration
  def change
    create_table(:roles) do |t|
      t.string :name

      t.timestamps
    end

    create_table(:users_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end
  end
end
