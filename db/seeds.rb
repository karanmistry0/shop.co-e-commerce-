# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create!(
  email: "admin@gmail.com",
  password: "123456",
  name: Faker::Lorem.sentence(word_count: 3)
)

19.times do |i|
   User.create!(
    email: "admin#{i}@gmail.com",
    password: "123456",
    name: Faker::Lorem.sentence(word_count: 3)
  )
end

category_names = ['New arrivals','Top selling','Casual','Formal','Party','Gym']
category_types = ['T shirt','Jeans','Shirt','Trousers','Shorts','CargoPants']


6.times do |i|

  category = Category.create!(
    name: category_names[i]
  )

  ((4..10).to_a.sample).times do
    product = Product.create!(
      name: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph(sentence_count: 2),
      discount: Faker::Boolean.boolean,
      color: Faker::Color.hex_color,
      size: Faker::Lorem.word(exclude_words: ['id', 'error']),
      price: Money.from_amount((50..500).to_a.sample, "USD"),
      discount_percent: (10..50).to_a.sample,
      product_type: category_types[(0..5).to_a.sample],
      category:category
      )

    product.images.attach(io: File.open("db/images/image_#{(1..13).to_a.sample}.png"),filename: product.name)
    product.images.attach(io: File.open("db/images/image_14.png"),filename: product.name)
    product.images.attach(io: File.open("db/images/image_15.png"),filename: product.name)
    product.images.attach(io: File.open("db/images/image_16.png"),filename: product.name)

    ((5..10).to_a.sample).times do
      Review.create!({
                       name: Faker::Lorem.sentence(word_count: 2),
                       description: Faker::Lorem.paragraph(sentence_count: 4),
                       rating: (1..5).to_a.sample,
                       product: product,
                       user: User.all.sample,
                     })

    end

  end
end

