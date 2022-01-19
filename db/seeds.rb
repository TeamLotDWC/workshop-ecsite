# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Genre.create!(
    name: "a"
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