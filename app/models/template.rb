class Template < ActiveRecord::Base
  belongs_to :container
  has_many :categories
end
