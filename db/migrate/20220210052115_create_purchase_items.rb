class CreatePurchaseItems < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_items do |t|
      t.references :purchase, null: false, index: true, foreign_key: true
      t.string :product_code
      t.string :product_name
      t.float :unit_product_mrp
      t.float :unit_product_discount
      t.float :unit_product_amount
      t.float :total_final_amount
      t.integer :quantity
      t.string :image

      t.timestamps
    end
  end
end
