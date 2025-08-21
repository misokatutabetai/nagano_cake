class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details

  has_one_attached :image

  validates :genre_id, inclusion: { in: Genre.pluck(:id) }
  validates :name, presence:true, uniqueness: true
  validates :introduction, presence:true
  validates :price, presence:true
end
