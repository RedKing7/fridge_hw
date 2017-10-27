require_relative '../config/environment'
require_relative '../app/models/fridge'

def list_all_fridges
  puts
  puts 'all fridges:'
  Fridge.all.each do |fridge|
    print 'ID: ', fridge.id
    print 'brand: ', fridge.brand
    print ' size: ', fridge.size
    puts
  end
  puts
end

input = ''

while input != 'quit'
  puts '-----------------------------------------'
  puts 'Make a choice :'
  puts '\'list\' - list all fridges'
  puts '\':fridgeId\' - view contents of fridge with id'
  puts 'type \'quit\' to quit'
  puts '-----------------------------------------'
  input = gets.chomp.downcase
  case input
  when 'list'
    list_all_fridges
  end
end
