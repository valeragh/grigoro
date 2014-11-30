class Item < ActiveRecord::Base
  belongs_to :template
  has_many :item_category_values
  
  accepts_nested_attributes_for :item_category_values

end
