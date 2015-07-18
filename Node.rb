require 'pry'

class Node
  attr_accessor :left, :right, :value, :depth

  def initialize(value, depth = 0)
    @value = value
    @right = nil
    @left = nil
    @depth = depth
  end

  def look_max
    if @right
      @right.look_max
    else
      puts @value
      @value
    end
  end

  def look_min
    if @left
      @left.look_min
    else
      puts @value
      @value
    end
  end

  def greater_than?(other_node_value)
    @value > other_node_value
  end

  def less_than?(other_node_value)
    @value < other_node_value
  end

  def new_node(new_value, depth = 0)
    depth += 1
    if self.less_than?(new_value)
      if @right == nil
        @right = Node.new(new_value, depth)
      else
        @right.new_node(new_value, depth)
      end
    end
    if self.greater_than?(new_value)
      if @left == nil
        @left = Node.new(new_value, depth)
      else
        @left.new_node(new_value, depth)
      end
    end
  end

  def find_value(hunt)
    if @value == hunt
      puts "#{hunt} was found."
      "#{hunt} was found."
    elsif self.greater_than?(hunt)
      if @left == nil
        "#{hunt} was not found."
      else
        @left.find_value(hunt)
      end
    elsif self.less_than?(hunt)
      if @right == nil
        "#{hunt} was not found."
      else
        @right.find_value(hunt)
      end
    end
  end

  # def print_values()
  #   below_me = {}
  #
  #
  #   if @left
  #     below_me[@left.depth] = [@left.value]
  #     @left.print_values.each do |key, value|
  #       below_me[key] = [value]
  #     end
  #
  #   elsif !@left
  #     below_me[self.depth+1] = ['']
  #   end
  #
  #   if @right
  #     below_me[@right.depth] << @right.value
  #     @right.print_values.each do |key, values|
  #       values.each do |value|
  #         binding.pry
  #         below_me[key] << [value]
  #       end
  #     end
  #   elsif !@right && @left
  #     below_me[self.depth+1] << ''
  #   end
  #   below_me
  # end

  def order_values

    pairs = [self.value]
    if @left
      pairs.unshift(@left.order_values)
    end

    if @right
      pairs << @right.order_values
    end
    pairs
  end



end
