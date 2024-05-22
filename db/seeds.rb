# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#管理者
Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)

#顧客サンプル
Customer.create!(
  last_name: '山田',
  first_name: '太郎',
  last_name_kana: 'ヤマダ',
  first_name_kana: 'タロウ',
  postal_code: '123-4567',
  address: '東京都渋谷区',
  phone_number: '090-1234-5678',
  email: 'sample@example.com',
  password: 'password',
  password_confirmation: 'password'
)

Customer.create!(
  last_name: '佐藤',
  first_name: '花子',
  last_name_kana: 'サトウ',
  first_name_kana: 'ハナコ',
  postal_code: '111-2222',
  address: '東京都新宿区',
  phone_number: '080-1111-2222',
  email: 'hanako@example.com',
  password: 'password',
  password_confirmation: 'password'
)

Customer.create!(
  last_name: '鈴木',
  first_name: '次郎',
  last_name_kana: 'スズキ',
  first_name_kana: 'ジロウ',
  postal_code: '333-4444',
  address: '東京都港区',
  phone_number: '090-3333-4444',
  email: 'jiro@example.com',
  password: 'password',
  password_confirmation: 'password'
)

customer = Customer.find_by(id:1) #顧客のID

# 住所情報を作成
customer.addresses.create!(
  address: '東京都渋谷区1-2-3',
  name: '山田太郎',
  post_code: '123-4567'
)
customer.addresses.create!(
  address: '東京都新宿区4-5-6',
  name: '佐藤花子',
  post_code: '111-2222'
)
customer.addresses.create!(
  address: '東京都港区7-8-9',
  name: '鈴木次郎',
  post_code: '333-4444'
)

# ジャンルデフォルト値
Genre.create(name: '和菓子')
Genre.create(name: '洋菓子')
Genre.create(name: '果物')

# 画像のパスを取得するヘルパーメソッドの定義
def image_path(filename)
  Rails.root.join('app/assets/images', filename)
end

# 商品サンプル
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

