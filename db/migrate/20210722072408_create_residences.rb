class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|
      t.string :postal_code
      t.integer :delivery_id
      t.string :municipality
      t.string :address
      t.string :building_name
      t.string :phone_number
      t.references :purchase, foreign_key: true


      t.timestamps
    end
  end
end
