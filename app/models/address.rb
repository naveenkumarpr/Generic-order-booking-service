class Address < ApplicationRecord
  validates :name, :email, :mobile, :address_line_1, :address_line_2, :city, :pincode, :state, :country, presence: true
  validates :mobile, format: { with: /[0-9]{10}/ , message: "mobile number should contain only 10 digits with 0-9 "}
  validates :email, format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Invalid Email" }
  scope :shipping_address, -> { where(type: 'ShippingAddress') }
  scope :billing_address, -> { where(type: 'BillingAddress') }
  belongs_to :purchase
end
