class RenameItemCategoryValuesToValues < ActiveRecord::Migration
  def change
    rename_table :item_category_values, :values
  end
end
