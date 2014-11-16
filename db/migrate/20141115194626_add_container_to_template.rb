class AddContainerToTemplate < ActiveRecord::Migration
  def change
    add_reference :templates, :container, index: true
  end
end
