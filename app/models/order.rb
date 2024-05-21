class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details # 中間テーブル
  has_many :items, through: :order_details # 注文には商品が多くある
  has_one_attached :image

  enum status: { 入金待ち: 0, 入金確認: 2, 製作中: 3, 発送準備中: 4, 発送済み: 5 }
  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
end