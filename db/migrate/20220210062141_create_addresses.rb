class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :pincode
      t.string :state
      t.string :country
      t.string :type

      t.timestamps
    end
  end
end
