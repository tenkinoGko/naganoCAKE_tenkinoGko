class Address < ApplicationRecord
  belongs_to :customer

  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def full_adresses
    "#{post_code} #{address} #{name}"
  end
end