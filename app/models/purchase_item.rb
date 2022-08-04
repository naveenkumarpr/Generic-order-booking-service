class PurchaseItem < ApplicationRecord
  validates :product_code, :product_name, :unit_product_mrp, :unit_product_discount, :unit_product_amount, :total_final_amount, :quantity, :image_url, presence: true
  belongs_to :purchase
end
