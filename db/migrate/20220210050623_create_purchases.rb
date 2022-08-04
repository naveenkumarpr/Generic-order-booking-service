class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.string :order_number
      t.references :customer, null: false, index: true, foreign_key: true
      t.datetime :order_placed_at
      t.string :vertical_code
      t.float :total_mrp
      t.float :total_discount
      t.float :total_final_amount
      t.string :status

      t.timestamps
    end
  end
end
