class Item < ActiveRecord::Base
  belongs_to :template

  has_many :categories, through: :values
  has_many :values, dependent: :destroy

  accepts_nested_attributes_for :values

  scope :ordered_asc, -> { order("description asc") }
end
