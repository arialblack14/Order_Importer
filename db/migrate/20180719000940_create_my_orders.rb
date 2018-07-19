class CreateMyOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :my_orders do |t|
      t.string :Name
      t.string :Email

      t.timestamps
    end
  end
end
