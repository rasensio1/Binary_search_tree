require 'pry'
require './tree'
require './node'


my_tree = Tree.new('test_files/input_test_4.txt')
my_tree.map_data_to_tree(my_tree.create_array_from_input)
my_tree.find_max
my_tree.find_min
my_tree.find_value(6)
my_tree.print_tree
