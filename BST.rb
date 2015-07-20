require 'pry'
require './tree'
require './node'


my_tree = Tree.new('./input.txt')
my_tree.map_data_to_tree(my_tree.create_array_from_input)
puts my_tree.find_max
puts my_tree.find_min
puts my_tree.find_value(6)
my_tree.order_values
puts my_tree.max_depth
my_tree.print_tree
