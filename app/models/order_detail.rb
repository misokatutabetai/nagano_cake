class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { not_producible: 0, waiting_production: 1, in_production: 2, pruduced: 3 }
  def subtotal
    item.with_tax_price * amount
  end
end
