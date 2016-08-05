class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.float :star
      t.references :product
      t.references :user
      t.timestamps null: false
    end
  end
end
