class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details

  has_one_attached :image

  validates :genre, presence: true, if: -> { genre_id.present? }
  validates :name, presence:true, uniqueness: true
  validates :introduction, presence:true
  validates :price, presence:true
end
