class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :category_id
      t.text :item_description
      t.integer :status_id
      t.integer :burden_id
      t.integer :delivery_id
      t.integer :day_delivery_id
      t.string :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
