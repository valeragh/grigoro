class AddTemplateToItems < ActiveRecord::Migration
  def change
    add_reference :items, :template, index: true
  end
end
