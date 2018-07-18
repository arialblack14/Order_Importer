class CreateMyProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :my_products do |t|
      t.string :product_id
      t.string :name
      t.integer :price
      t.text :description
      t.text :specs
      t.text :tags
      t.string :permalink
      t.float :position
      t.float :cost
      t.float :hts

      t.timestamps
    end
  end
end
