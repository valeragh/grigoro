class AddCategoryToItemCategoryValues < ActiveRecord::Migration
  def change
    add_reference :item_category_values, :category, index: true
  end
end
