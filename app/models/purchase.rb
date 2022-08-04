class Purchase < ApplicationRecord
  STATUS_TRANSITION = {
    "placed" => ["cancelled", "processing"],
    "processing" => ["delivered"],
    "delivered" => ["returned"],
    "cancelled" => [],
    "returned" => []
  }
  VERTICAL_CODE = %w[Grocery BusTicket MovieTicket FlightTicket TrainTicket Taxi Food DoctorConsultaton Medicine]
  STATUSES = %w[placed cancelled returned processing delivered].freeze
  validates :vertical_code, inclusion: { in: VERTICAL_CODE, message: "Not a valid Vertical Code" }
  validates :status, inclusion: { in: STATUSES, message: "Not a valid Status" }
  validates :order_number, :order_placed_at, :vertical_code, :total_mrp, :total_discount, :total_final_amount, :status, presence: true
  validates :order_number, uniqueness: true
  has_many :addresses,  dependent: :destroy
  has_many :payment_methods,  dependent: :destroy
  has_many :purchase_items, dependent: :destroy
  belongs_to :customer
  delegate :shipping_address, :billing_address,  to: :addresses

  def is_status_updatable(new_status)
    STATUS_TRANSITION[self.status].include?(new_status)
  end
end
