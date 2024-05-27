class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details # 中間テーブル
  has_many :items, through: :order_details # 注文には商品が多くある
  has_one_attached :image

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  enum status: {
     "入金待ち":0,
     "入金確認":1,
     "製作中":2,
     "発送準備中":3,
     "発送済み":4
  }

  enum making_sta: {
     "製作不可":0,
     "製作待ち":1,
     "製作中やで":2,
     "製作完了":3
  }

enum payment_method: ["クレジットカード", "銀行振込"]

end
