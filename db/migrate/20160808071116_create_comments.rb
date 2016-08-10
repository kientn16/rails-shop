class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :vote
      t.references :user
      t.references :product
      t.timestamps null: false
    end
  end
end
