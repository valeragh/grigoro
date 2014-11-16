class AddTemplateToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :template, index: true
  end
end
