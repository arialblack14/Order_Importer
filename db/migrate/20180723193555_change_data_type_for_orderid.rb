class ChangeDataTypeForOrderid < ActiveRecord::Migration[5.2]
  def change
    change_column :my_orders, :OrderId, :string
  end
end
