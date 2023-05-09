# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

apartments1 = [
  {
    street: '123 Street',
    unit: '1B',
    city: 'Buffalo',
    state: 'NY',
    square_footage: 1000,
    price: '1500',
    bedrooms: 2,
    bathrooms: 1.5,
    pets: 'yes!',
    image: 'https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img/https://www.glenwoodnyc.com/wp-content/uploads/2022/05/2-JSP-LOBBY-01-02-1280.jpg'
  },
  {
    street: '32 Boulevard',
    unit: '4 and a half',
    city: 'San Diego',
    state: 'CA',
    square_footage: 500,
    price: '30,000,000',
    bedrooms: 0,
    bathrooms: 0.5,
    pets: 'NO',
    image: 'https://www.moriliving.com/images/home/img_slide_003.jpg'
  }
]

apartments2 = [
  {
    street: '85 Yellow Snow RD',
    unit: '5P',
    city: 'New York',
    state: 'NY',
    square_footage: 800,
    price: '999,999,999,999,999',
    bedrooms: 1,
    bathrooms: 0,
    pets: 'NO',
    image: 'https://www.moriliving.com/images/home/img_slide_006.jpg'
  }
]

apartments1.each do |apartment|
  user1.apartments.create(apartment)
  puts "creating: #{apartment}"
end

apartments2.each do |apartment|
  user2.apartments.create(apartment)
  puts "creating: #{apartment}"
end