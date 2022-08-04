class PaymentMethod < ApplicationRecord
  PAYMENT_MODE  =  %w[CreditCard DebitCard UPI CashPayment]
  validates :payment_mode, inclusion: { in: PAYMENT_MODE, message: "Not a valid payment mode" }
  validates :payment_mode, :amount, :transaction_reference_number, :transaction_at, presence: true
  belongs_to :purchase
end
