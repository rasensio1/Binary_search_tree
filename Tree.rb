require './node'
require 'pry'

class Tree
  attr_reader :input_file, :first_node

  def initialize(input_file)
    @input_file = File.open("./#{input_file}", "r")
    @output_file = File.open("./output_file.txt", "w")
    @first_node = nil
  end

  def create_array_from_input
    @input_file.rewind
    input_array = []
    input_array = @input_file.readlines.map {|element| element.gsub("\n", "").to_i}
  end

  def map_data_to_tree(input_array)
    @first_node = Node.new(input_array.shift)

    input_array.count.times do |element|
      @first_node.new_node(input_array.shift)
    end
  end


  def print_tree
    puts "Printing the Tree".center(80, "-")
    puts @first_node.value.to_s.center(80, " ")

    levels_hash = @first_node.print_values
    formats_tree_for_printing(levels_hash)

    1.upto(levels_hash.size) do |i|
      puts "#{i} : #{levels_hash[i].flatten}".center(80, " ")
    end
  end

  def formats_tree_for_printing(hash)
    levels_array = []

  end

  def find_max
    max = @first_node.look_max
    puts "The maximum value is #{max}"
    max
  end

  def find_min
    min = @first_node.look_min
    puts "The minimum value is #{min}"
    min
  end

  def find_value(hunt)
    @first_node.find_value(hunt)
  end

  def order_values
    output_file = File.open('./output.txt', 'w')
    output_file.write (@first_node.order_values.flatten)
    @first_node.order_values.flatten
  end

  def delete_value_from_tree(hunt)
    reassign = @first_node.delete_value(hunt).flatten
    reassign.count.times do |element|
      @first_node.new_node(reassign.shift)
    end
  end



end
