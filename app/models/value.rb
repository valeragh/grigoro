class Value < ActiveRecord::Base
  belongs_to :item
  belongs_to :category

  scope :ordered, -> { order("category_id asc") }
end
