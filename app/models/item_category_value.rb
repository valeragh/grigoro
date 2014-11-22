class ItemCategoryValue < ActiveRecord::Base
  belongs_to :item
  belongs_to :category

  def self.all_as_hash
    all_records = ItemCategoryValue.all.to_a
    all_records.each_with_object(Hash.new({})) do |icv, result|
      result[icv[:item_id]] = result[icv[:item_id]].merge Hash[icv[:category_id], icv[:value]]
    end
  end
end
