class AddItemToItemCategoryValues < ActiveRecord::Migration
  def change
    add_reference :item_category_values, :item, index: true
  end
end
