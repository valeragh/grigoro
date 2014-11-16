class AddContainerToItems < ActiveRecord::Migration
  def change
    add_reference :items, :container, index: true
  end
end
