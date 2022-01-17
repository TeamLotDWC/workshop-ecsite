# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: 'test_admin@gmail.com',
    password: 'testtest',

)

Customer.create!(
    email: 'a@a',
    family_name: 'aa',
    first_name: 'aa',
    family_name_kana: 'bb',
    first_name_kana: 'bb',
    zip_code: 'aaa',
    address: 'aaaa',
    phone_number: 'aaaaa',
    password: 'aaaaaa'
)
