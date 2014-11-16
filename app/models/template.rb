class Template < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  has_many :items
end
