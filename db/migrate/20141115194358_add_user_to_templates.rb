class AddUserToTemplates < ActiveRecord::Migration
  def change
    add_reference :templates, :user, index: true
  end
end
