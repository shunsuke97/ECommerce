# create!は、作成に失敗したときに例外を発生させて処理を止める
# seedsは必ず成功してデータを保存してほしいため、create!を使用する
20.times do
  Product.create!(
    name: Faker::Book.title,
    description: Faker::Lorem.paragraph(2),
    price: Faker::Number.within(100..100000),
    # %w(yen usd) == ["yen", "usd"]
    unit: %w(yen usd).sample
  )
end