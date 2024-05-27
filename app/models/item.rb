class Item < ApplicationRecord
  belongs_to :genre

  scope :active, -> { where(is_active: true) }

  has_one_attached :image

  has_many :cart_items, dependent: :destroy

  has_many :order_detalis  #中間テーブル
  has_many :orders, through: :order_details


  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

 def get_item_image(width, height)
  image.variant(resize_to_limit: [width, height]).processed
 end

end
