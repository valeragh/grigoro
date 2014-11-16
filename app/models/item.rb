class Item < ActiveRecord::Base
  belongs_to :template
  has_many :item_category_values
end
