# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.destroy_all

Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)

#　商品サンプル
Genre.create(name: '和菓子')
Genre.create(name: '洋菓子')
Genre.create(name: '果物')

# 画像のパスを取得するヘルパーメソッドの定義
def image_path(filename)
  Rails.root.join('app/assets/images', filename)
end

item = Item.new(
  genre_id: 1,
  name: 'たいやき',
  introduction: 'もちもちとした生地に、あんこを包み込んで焼き上げた人気の和菓子です。',
  price: 150,
  is_active: true
)
image_file = File.open(image_path('Sample_item1.jpg'))
item.image.attach(io: image_file, filename: 'Sample_item1.jpg', content_type: 'image/jpeg')
item.save!

item = Item.new(
  genre_id: 2,
  name: 'ドーナツ',
  introduction: 'ふんわりとした生地に甘いグレーズがかかった、アメリカ発祥の人気スイーツです。',
  price: 200,
  is_active: true
)
image_file = File.open(image_path('Sample_item2.jpg'))
item.image.attach(io: image_file, filename: 'Sample_item2.jpg', content_type: 'image/jpeg')
item.save!

item = Item.new(
  genre_id: 3,
  name: 'いちご',
  introduction: 'ジューシーで甘酸っぱいイチゴの風味を楽しむことができる、人気のフルーツです。',
  price: 300,
  is_active: true
)
image_file = File.open(image_path('Sample_item3.jpg'))
item.image.attach(io: image_file, filename: 'Sample_item3.jpg', content_type: 'image/jpeg')
item.save!