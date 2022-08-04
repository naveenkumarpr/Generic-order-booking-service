class Customer < ApplicationRecord
  validates :full_name, :email, :mobile, presence: true
  validates :email, :mobile, uniqueness: true
  validates :mobile, format: { with: /[0-9]{10}/ , message: "mobile number should contain only 10 digits with 0-9 "}
  validates :email, format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "Invalid Email" }
  has_many :purchases
end
