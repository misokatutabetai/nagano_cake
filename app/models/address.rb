class Address < ApplicationRecord
  belongs_to :customer

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end

  def postal_display
    '〒' + postal_code.slice(0..2) + '-' + postal_code.slice(3..6)
  end
end
