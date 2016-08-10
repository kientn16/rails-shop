class ChangeTypeTotalToOrderItems < ActiveRecord::Migration
  def up
    change_column :order_items, :unit_price, :integer
    change_column :order_items, :total_price, :integer

  end

  def down
    change_column :order_items, :subtotal, :decimal
    change_column :order_items, :tax, :decimal
  end
end
