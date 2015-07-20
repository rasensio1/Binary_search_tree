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
    ordered_lines = flatten_array(levels_hash)
    no_nil = remove_nil(ordered_lines)
    formatted = format_output_lines(no_nil)

    reduce_output_lines(formatted).each do |line|
      puts "#{line}"
    end
  end

  def max_depth
    depth = @first_node.print_values.size
    "The maxiumum depth is #{depth}"
  end

  def flatten_array(hash)
    ordered_lines = []
      1.upto(hash.size) do |i|
        ordered_lines[i] = hash[i].flatten
      end
      ordered_lines
  end

  def remove_nil(array)
    no_nil = []
    array.shift
    array.each do |row|
      no_nil << row.map do |element|
        if element == nil
          element = " "
        else
          element
        end
      end
    end
    no_nil
  end

  def format_output_lines(array_no_nil)
    formatted = []
    0.upto(array_no_nil.size-1) do |index|

      formatted << array_no_nil[index].map do |element|
        " #{' '*(80/(array_no_nil[index].size+1) - 2)}#{element.to_s}"
      end
    end
    formatted
  end

  def reduce_output_lines(formatted_array)

    formatted_array.map do |line|
      line.reduce('') do |total,x|
        total + x
      end
    end
  end



  def find_max
    max = @first_node.look_max
    "The maximum value is #{max}"
  end

  def find_min
    min = @first_node.look_min
    "The minimum value is #{min}"
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
