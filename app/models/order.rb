class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_payment: 0, confirmed_payment: 1, in_progress: 2, preparing_shipment: 3, shipped: 4 }

  scope :new_order, -> { order(created_at: :desc) }

  def subtotal_total
    @subtotal = 0
    order_details.each do |order_detail|
      @subtotal += order_detail.subtotal
    end
    return @subtotal
  end
end
