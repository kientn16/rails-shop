class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :avatar
      t.integer :status
      t.references :category
      t.timestamps null: false
    end
  end
end
