class Item < ActiveRecord::Base
  belongs_to :template
  has_many :item_category_values
  
  accepts_nested_attributes_for :item_category_values

  def build_item_category_values
    Category.find_each do |category|
      ItemCategoryValue.find_or_create_by(item_id: self.id, category_id: category.id)
    end
  end
end
