# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying database..."
Ingredient.destroy_all
Cocktail.destroy_all

# puts "Seeding..."
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")


# Cocktail.create(name: "Mojito")
# Cocktail.create(name: "Moscomioul")
# puts "Seeding done !"



require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

user['drinks'].each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end


Cocktail.create(name: "Gin Tonic")