class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image

  has_many :cart_items, dependent: :destroy

  has_many :order_details
  has_many :orders, through: :order_details

end
