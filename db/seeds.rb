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
  first_name: '山田',
  last_name: '太郎',
  first_name_kana: 'ヤマダ',
  last_name_kana: 'タロウ',
  postal_code: '123-4567',
  address: '東京都渋谷区',
  phone_number: '090-1234-5678',
  email: 'sample@example.com',
  password: 'password',
  password_confirmation: 'password'
)

Customer.create!(
  first_name: '佐藤',
  last_name: '花子',
  first_name_kana: 'サトウ',
  last_name_kana: 'ハナコ',
  postal_code: '111-2222',
  address: '東京都新宿区',
  phone_number: '080-1111-2222',
  email: 'hanako@example.com',
  password: 'password',
  password_confirmation: 'password'
)

Customer.create!(
  first_name: '鈴木',
  last_name: '次郎',
  first_name_kana: 'スズキ',
  last_name_kana: 'ジロウ',
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
Genre.create(name: '駄菓子')
Genre.create(name: 'その他')

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
  genre_id: 2,
  name: 'ロールケーキ',
  introduction: 'ふわふわのスポンジ生地と甘いクリームが絶妙なバランスのロールケーキです。お茶うけやパーティーにぴったりです。',
  price: 500,
  is_active: true
)
image_file = File.open(image_path('Sample_item3.jpg'))
item.image.attach(io: image_file, filename: 'Sample_item3.jpg', content_type: 'image/jpeg')
item.save!

item = Item.new(
  genre_id: 2,
  name: 'クグロフ',
  introduction: 'バターと卵を主成分とした、ふわふわのケーキです。リッチな風味としっとりとした食感が特徴で、ホイップクリームやフルーツと一緒に楽しむのがおすすめです。',
  price: 800,
  is_active: true
)
image_file = File.open(image_path('Sample_item4.jpg'))
item.image.attach(io: image_file, filename: 'Sample_item4.jpg', content_type: 'image/jpeg')
item.save!

item = Item.new(
  genre_id: 2,
  name: '大人のクッキー',
  introduction: '濃厚なチョコレートとほんのりとしたビターコーヒー風味が絶妙なハーモニーを奏でる大人のためのクッキーです。クランチ感のある食感と上品な甘さが特徴で、ワインや紅茶との相性も抜群です。',
  price: 300,
  is_active: true
)
image_file = File.open(image_path('Sample_item5.jpg'))
item.image.attach(io: image_file, filename: 'Sample_item5.jpg', content_type: 'image/jpeg')
item.save!

item = Item.new(
  genre_id: 2,
  name: 'プレーンクッキー',
  introduction: 'サクサクとした食感と甘さが特徴のクッキーです。バターとシュガーの風味が広がり、チョコチップやナッツなどのトッピングでさらなる味わいを楽しむことができます。おやつやお茶うけに最適です。',
  price: 200,
  is_active: true
)
image_file = File.open(image_path('Sample_item6.jpg'))
item.image.attach(io: image_file, filename: 'Sample_item6.jpg', content_type: 'image/jpeg')
item.save!

item = Item.new(
  genre_id: 1,
  name: '柏餅',
  introduction: 'もちもちとした食感が特徴の和菓子、柏餅です。もち米を粉砕して作ったもち生地に、あんこやきな粉を包んでいます。風味豊かな抹茶との相性も抜群です。お茶や抹茶と一緒に楽しんでください。',
  price: 250,
  is_active: true
)
image_file = File.open(image_path('Sample_item7.jpg'))
item.image.attach(io: image_file, filename: 'Sample_item7.jpg', content_type: 'image/jpeg')
item.save!

item = Item.new(
  genre_id: 3,  # ジャンルIDは適宜変更してください
  name: 'カラフルチョコ',
  introduction: '色とりどりのチョコレートが詰まったお菓子です。見た目の美しさと様々な味わいが楽しめるのが特徴です。甘さと苦さ、そしてフルーティな風味が絶妙に組み合わさった一口サイズのチョコレートです。パーティーやギフトにもおすすめです。',
  price: 200,  # 価格は適宜変更してください
  is_active: true
)
image_file = File.open(image_path('Sample_item8.jpg'))  # カラフルチョコの写真に相当するファイルを指定してください
item.image.attach(io: image_file, filename: 'Sample_item8.jpg', content_type: 'image/jpeg')  # カラフルチョコの写真に相当するファイル名を指定してください
item.save!

item = Item.new(
  genre_id: 3,  # ジャンルIDは適宜変更してください
  name: 'ラムネ菓子',
  introduction: '爽やかな味わいが魅力のラムネ菓子です。甘酸っぱい風味とサクサクとした食感が特徴で、一口食べると口の中でとろけていくのが楽しいです。懐かしい味わいと可愛らしい見た目が魅力の一品です。お子さんから大人まで幅広い年齢層に人気です。',
  price: 200,  # 価格は適宜変更してください
  is_active: true
)
image_file = File.open(image_path('Sample_item9.jpg'))  # ラムネ菓子の写真に相当するファイルを指定してください
item.image.attach(io: image_file, filename: 'Sample_item9.jpg', content_type: 'image/jpeg')  # ラムネ菓子の写真に相当するファイル名を指定してください
item.save!

item = Item.new(
  genre_id: 4,
  name: 'いなり寿司',
  introduction: '美味しいいなり寿司です。甘辛い味付けが特徴で、ご飯との相性も抜群です。',
  price: 300,
  is_active: true
)
image_file = File.open(image_path('Sample_item10.jpg'))
item.image.attach(io: image_file, filename: 'Sample_item10.jpg', content_type: 'image/jpeg')
item.save!

item = Item.new(
  genre_id: 2,  # ジャンルIDは適宜変更してください
  name: 'シュークリーム',
  introduction: 'ふんわりとした生地の中に、バニラ風味のクリームがたっぷり詰まったシュークリームです。サクサクとした食感と、濃厚なクリームの絶妙なバランスが特長です。おやつやデザートとして、幅広いシーンでお楽しみいただけます。',
  price: 200,  # 価格は適宜変更してください
  is_active: true
)

image_file = File.open(image_path('Sample_item11.jpg'))  # シュークリームの写真に相当するファイルを指定してください
item.image.attach(io: image_file, filename: 'Sample_item11.jpg', content_type: 'image/jpeg')  # シュークリームの写真に相当するファイル名を指定してください
item.save!