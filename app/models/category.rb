class Category < ActiveRecord::Base
  belongs_to :template

  has_many :items, through: :values
  has_many :values, dependent: :destroy
end
