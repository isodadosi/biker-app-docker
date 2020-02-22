# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == 'development'

    # (1..50).each do |i|
    #     Content.create(title: "タイトル#{i}", body: "内容#{i}", place: "大阪府池田市")
    # end

    Prefecture.create([
        { name: '北海道'},
        { name: '大阪'},
        { name: '東京'},
        { name: '福岡県'},
        { name: '兵庫県'}
    ])
end