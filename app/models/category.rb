class Category < ActiveRecord::Base
  belongs_to :template

  has_many :items, through: :item_category_values
  has_many :item_category_values, dependent: :destroy
end
