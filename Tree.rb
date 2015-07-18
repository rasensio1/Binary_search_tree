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
    puts "Printing the Tree".center(40, "-")
    puts @first_node.value
    puts @first_node.print_values
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
    puts @first_node.find_value(hunt)
    @first_node.find_value(hunt)
  end

  def order_values

  end

  def delete_value
  end
end