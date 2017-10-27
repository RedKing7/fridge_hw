require_relative '../config/environment'
require_relative '../app/models/fridge'

def list_all_fridges
  puts
  puts 'all fridges:'
  puts '------------------------------------------'
  Fridge.all.each do |fridge|
    print '|ID: ', fridge.id
    print '| brand: ', fridge.brand
    print ' | size: ', fridge.size, 'ft^3'
    print ' | location: ', fridge.location
    puts
  end
  puts '------------------------------------------'
  puts
end

def show_food(fridge_id)
  puts 'Food in fridge ', fridge_id
  puts ' Foods:'
  Fridge.find(fridge_id).foods.each do |item|
    print 'food id: ', item.id
    print ' | name: ', item.name
    print ' | weight: ', item.weight, 'lbs.'
    print ' | vegan: ', item.vegan
    print ' | put in fridge: ', item.created_at
    puts
  end
  puts
end

def show_drinks(fridge_id)
  puts 'Drinks in fridge ', fridge_id
  puts ' Drinks:'
  Fridge.find(fridge_id).drinks.each do |item|
    print 'Drink id: ', item.id
    print ' | name: ', item.name
    print ' | size: ', item.size, 'oz.'
    puts
  end
  puts
end

def pick_fridge
  puts 'Fridge ID?'
  fridge_id = gets.chomp.to_i
  puts 'Show food (1) or drinks (2)?'
  input = gets.chomp.to_i
  puts '------------------------------------------'
  case input
  when 1
    show_food(fridge_id)
  when 2
    show_drinks(fridge_id)
  else
    puts 'invalid choice'
  end
  puts '------------------------------------------'
end

def add_fridge
  puts 'Brand?'
  brand = gets.chomp
  puts 'Location?'
  location = gets.chomp
  puts 'Size?'
  size = gets.chomp.to_i
  new_fridge = Fridge.new
  new_fridge.brand = brand
  new_fridge.location = location
  new_fridge.size = size
  new_fridge.save
  puts 'Fridge saved'
  puts
end

def delete_fridge
  puts 'ID of fridge to delete?'
  fridge_id = gets.chomp.to_i
  Fridge.find(fridge_id).destroy
  puts 'Fridge ', fridge_id, 'deleted'
end

def remove_food(fridge_id)
  puts 'ID of food item to consume?'
  food_id = gets.chomp.to_i
  Fridge.find(fridge_id).foods.find(food_id).destroy
  print 'food item ', food_id, ' consumed'
  puts
end

def remove_drink(fridge_id)
  puts 'ID of drink to consume?'
  drink_id = gets.chomp.to_i
  
  Fridge.find(fridge_id).drinks.find(drink_id).destroy
  print 'drink ', drink_id, ' drunk'
  puts
end

def remove_from_fridge
  puts 'ID of fridge to remove from?'
  fridge_id = gets.chomp.to_i
  puts 'remove food(1) or drink(2)?'
  choice = gets.chomp.to_i
  if choice == 1
    remove_food(fridge_id)
  elsif choice == 2
    remove_drink(fridge_id)
  else
    puts 'invalid input'
  end
end

input = ''

while input != 'quit'
  puts '-----------------------------------------'
  puts 'Make a choice :'
  puts '\'list\' - list all fridges'
  puts '\'1\' - view specific fridge'
  puts '\'add\' - add a fridge'
  puts '\'delete\' - remove a fridge'
  puts '\'remove\' - eat/drink item from fridge'
  puts 'type \'quit\' to quit'
  puts '-----------------------------------------'
  input = gets.chomp.downcase
  case input
  when 'list'
    list_all_fridges
  when '1'
    pick_fridge
  when 'add'
    add_fridge
  when 'delete'
    delete_fridge
  when 'remove'
    remove_from_fridge
  end
end
