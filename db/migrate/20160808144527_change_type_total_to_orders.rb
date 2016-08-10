class ChangeTypeTotalToOrders < ActiveRecord::Migration
  def change
    change_column :orders, :subtotal, :integer
    change_column :orders, :tax, :integer
    change_column :orders, :shipping, :integer
    change_column :orders, :total, :integer
  end
end