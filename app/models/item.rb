class Item < ActiveRecord::Base
  belongs_to :template

  has_many :categories, through: :item_category_values
  has_many :item_category_values, dependent: :destroy

  accepts_nested_attributes_for :item_category_values
end
