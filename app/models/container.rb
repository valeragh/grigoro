class Container < ActiveRecord::Base
  belongs_to :user
  has_one :template
  has_many :items
end
