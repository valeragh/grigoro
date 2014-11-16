class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :description
      t.hstore :categories, default: '', null: false 
      t.timestamps
    end
  end
end
