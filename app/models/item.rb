class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  has_one_attached :image

  validates :genre_id, inclusion: { in: Genre.pluck(:id) }
  validates :name, presence:true, uniqueness: true
  validates :introduction, presence:true
  validates :price, presence:true

  scope :new_order, -> { order(created_at: :desc) }

  def with_tax_price
    (price * 1.1).floor
  end

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
