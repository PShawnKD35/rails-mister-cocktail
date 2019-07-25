# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  Cocktail.destroy_all
  Ingredient.destroy_all
end

# Resouces location
# ingredients_uri = 'https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/ingredients.json'
ingredients_uri = 'ingredients.json'
recipes_uri = 'cocktails.json'

# Create Ingredients
ingredients_string = open(ingredients_uri).read
ingredients = JSON.parse(ingredients_string)
ingredients.each do |name, _values|
  Ingredient.create!(name: name)
end

# Create Coctails and Doses
recipes_string = open(recipes_uri).read
recipes = JSON.parse(recipes_string)
recipes.each do |recipe|
  cocktail = Cocktail.create(name: recipe['name'])
  recipe['ingredients'].each do |dose|
    Dose.create(description: dose['amount'], ingredient: Ingredient.find_by(name: dose['ingredient']), cocktail: cocktail) unless dose['ingredient'].nil?
  end
end
