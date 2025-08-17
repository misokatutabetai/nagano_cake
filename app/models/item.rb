class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details

  has_one_attached :image

  validates :name, presence:true
  validates :price, presence:true
end
