class ChangeTypeColumsDescriptionToProducts < ActiveRecord::Migration
  def change
    change_column :products, :description, :text, null: true
  end
end
