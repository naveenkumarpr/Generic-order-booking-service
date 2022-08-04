class ChangePurchaseItemColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :purchase_items, :image, :image_url
  end
end
