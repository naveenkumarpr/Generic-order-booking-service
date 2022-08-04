class CreatePaymentMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_methods do |t|
      t.string :payment_mode
      t.float :amount
      t.string :transaction_reference_number
      t.datetime :transaction_at
      t.references :purchase, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
