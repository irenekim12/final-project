class CreateFurnitures < ActiveRecord::Migration[6.0]
  def change
    create_table :furnitures do |t|
      t.string :name
      t.string :image
      t.integer :owner_id
      t.string :location
      t.text :item_details
      t.string :category
      t.string :retailer
      t.float :retail_price
      t.datetime :purchase_date
      t.float :asking_price
      t.datetime :sell_by
      t.text :notes

      t.timestamps
    end
  end
end
