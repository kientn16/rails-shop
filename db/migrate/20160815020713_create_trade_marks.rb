class CreateTradeMarks < ActiveRecord::Migration
  def change
    create_table :trade_marks do |t|
      t.string :name
      t.integer :status

      t.timestamps null: false
    end
  end
end
