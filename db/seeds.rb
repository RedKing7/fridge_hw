# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Fridge.destroy_all

Fridge.create(location: 'Atlanta', brand: 'Frigidaire', size: 20)
Fridge.create(location: 'Garage', brand: 'General Electric', size: 15)
Fridge.create(location: 'Kitchen', brand: 'LG', size: 30)

Food.create(fridge_id: 1, name: 'apple', weight: 4, vegan: true)
Food.create(fridge_id: 2, name: 'banana', weight: 3, vegan: true)
Food.create(fridge_id: 3, name: 'grapes', weight: 2, vegan: true)

Food.create(fridge_id: 1, name: 'steak', weight: 8, vegan: false)

Drink.create(fridge_id: 1, name: 'Dr.Pepper', size: 8, alcoholic: false)
Drink.create(fridge_id: 2, name: 'Milk', size: 64, alcoholic: false)
Drink.create(fridge_id: 3, name: 'Orange Juice', size: 32, alcoholic: false)
