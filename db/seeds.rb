# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Supplier.destroy_all

5.times do
  supplier = Supplier.create(
      name: Faker::Name.name, 
      email: Faker::Internet.email, 
      phone: Faker::PhoneNumber.phone_number
      )
end

20.times do
  product = Product.create(
    name: Faker::Cat.breed, 
    price: Faker::Commerce.price,  
    description: Faker::Cat.registry,
    in_stock: true,
    supplier_id: 1
    )
end

# Supplier.create([
#   {
#     name: "",
#     email: "",
#     phone: ""
#   },
#   {
#     name: "",
#     email: "",
#     phone: ""
#   },
#   {
#     name: "",
#     email: "",
#     phone: ""
#   },
# ])
Image.destroy_all
20.times do
  image = Image.create(
    url: "https://img.memecdn.com/lava-goats_o_1204020.jpg",
    product_id: 1
    
    )


end


