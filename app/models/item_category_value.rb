class ItemCategoryValue < ActiveRecord::Base
  belongs_to :item
  belongs_to :category

  def self.all_for_template_as_hash template_id
    template_items = Item.where(template_id: template_id).pluck(:id)
    records = ItemCategoryValue.where(item_id: template_items).to_a
    records.each_with_object(Hash.new({})) do |icv, result|
      result[icv[:item_id]] = result[icv[:item_id]].merge Hash[icv[:category_id], icv[:value]]
    end
  end
end
