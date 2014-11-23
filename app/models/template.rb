class Template < ActiveRecord::Base
  belongs_to :user
  has_many :items
  has_many :categories

  accepts_nested_attributes_for :items
end
