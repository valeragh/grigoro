class CreateItemCategoryValues < ActiveRecord::Migration
  def change
    create_table :item_category_values do |t|
      t.boolean :value

      t.timestamps
    end
  end
end
