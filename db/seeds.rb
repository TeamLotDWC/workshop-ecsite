# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Genre.create!(
  [
    {
      name: "ケーキ"
    },
    {
      name: "焼き菓子"
    },
    {
      name: "チョコレート"
    }
  ]
)


5.times do |n|
    Customer.create!(
      email: "a#{n + 1}@a",
      family_name: "aa郎#{n + 1}",
      first_name: "aa#{n + 1}",
      family_name_kana: "bb#{n + 1}",
      first_name_kana: "bb#{n + 1}",
      zip_code: "aaa#{n + 1}",
      address: "aaaa#{n + 1}",
      phone_number: "aaaaa#{n + 1}",
      password: "aaaaaa#{n + 1}"
    )
  end

  Admin.create!(
    email: 'test_admin@gmail.com',
    password: 'testtest',

)

Item.create!(
  [
    {
      genre_id: 2,
      name: "カヌレ",
      introduction: "ラム酒やバニラの香りを効かせたフランスのお菓子です。",
      net_price: 195,
      is_stocked: 1,
      item_image: open("./app/assets/images/items/kanure.jpg")
    },
    {
      genre_id: 2,
      name: "マカロン",
      introduction: "外側がカリっとしていて中が柔らかく、香り豊かでとろけるような中身のマカロンです。",
      net_price: 280,
      is_stocked: 1,
      item_image: open("./app/assets/images/items/macaroon.jpg")
    },
    {
      genre_id: 3,
      name: "ピスタチオチョコレート",
      introduction: "カリフォルニア産のピスタチオを使用したミルクチョコレートです。",
      net_price: 214,
      is_stocked: 1,
      item_image: open("./app/assets/images/items/nuts.png")
    },
    {
      genre_id: 3,
      name: "生チョコレート",
      introduction: "北海道産の生クリームをたっぷりとブレンドした、シルクのように滑らかな口どけの生チョコレートです。",
      net_price: 1080,
      is_stocked: 1,
      item_image: open("./app/assets/images/items/rowchoko.jpg")
    },
    {
      genre_id: 1,
      name: "ショートケーキ",
      introduction: "沖縄県産の本和香糖を加えたスポンジ生地は、口どけの良いしっとりした食感が特長のケーキです。",
      net_price: 2450,
      is_stocked: 1,
      item_image: open("./app/assets/images/items/whole.jpg")
    },
    {
      genre_id: 1,
      name: "ロールケーキ",
      introduction: "口どけなめらかな優しい味わいのクリームにバニラビーンズを合わせ、ふんわりしっとり焼き上げた生地で包んがロールケーキです。",
      net_price: 1973,
      is_stocked: 1,
      item_image: open("./app/assets/images/items/roll.jpg")
    }
  ]
)