require 'minitest/autorun'
require './bst'

class TreeTest < Minitest::Test

  def test_it_creates_an_array_of_readlies

  end

end

class NodeTest < Minitest::Test

  def test_nodes_have_a_vaue_and_default_values
    node = Node.new(5)
    assert_equal Node, node.class
    assert_equal 5, node.value
    assert_equal nil, node.right
    assert_equal nil, node.left
    assert_equal 0, node.depth
  end

  def test_greater_and_less_than_works
    node1 = Node.new(12)
    node2 = Node.new(8)
    assert node1.greater_than?(8)
    refute node2.greater_than?(12)
    refute node1.less_than?(8)
  end

  def test_creates_an_object_left_if_placeholder_is_empty
    node1 = Node.new(12)
    node1.new_node(8)
    assert_equal Node, node1.left.class
    assert_equal 8, node1.left.value
  end

  def test_creates_an_object_right_if_placeholder_is_empty
    node1 = Node.new(12)
    node1.new_node(13)
    assert_equal Node, node1.right.class
    assert_equal 13, node1.right.value
  end

  def test_passes_new_node_function
    node1 = Node.new(5)
    node1.right = Node.new(7)
    node1.new_node(9)
    assert_equal Node, node1.right.right.class
    assert_equal 9, node1.right.right.value
  end

  def test_it_inputs_from_the_file
    tree = Tree.new("test_files/input_test_1.txt")
    assert_equal ["5\n", "6\n"], tree.input_file.readlines
  end

  def test_it_maps_2_values_to_a_tree
    tree = Tree.new("test_files/input_test_1.txt")
    tree.map_data_to_tree(tree.create_array_from_input)
    assert_equal Node, tree.first_node.right.class
    assert_equal 6, tree.first_node.right.value
  end

  def test_it_maps_7_values_to_a_tree
    tree = Tree.new("test_files/input_test_2.txt")
    tree.map_data_to_tree(tree.create_array_from_input)
    assert_equal 2, tree.first_node.value
    assert_equal 3, tree.first_node.right.value
    assert_equal 1, tree.first_node.left.value
    assert_equal 4, tree.first_node.right.right.value
    assert_equal 7, tree.first_node.right.right.right.value
    assert_equal 20, tree.first_node.right.right.right.right.value
    assert_equal 9, tree.first_node.right.right.right.right.left.value
  end

  def test_it_finds_the_max

    tree = Tree.new("test_files/input_test_2.txt")
    tree.map_data_to_tree(tree.create_array_from_input)
    assert_equal 20, tree.find_max
  end

  def test_it_finds_the_min
    tree = Tree.new("test_files/input_test_2.txt")
    tree.map_data_to_tree(tree.create_array_from_input)
    assert_equal 1, tree.find_min
  end

  # def test_it_records_depth
  #   tree = Tree.new("input_test_2.txt")
  #   tree.map_data_to_tree(tree.create_array_from_input)
  #   assert_equal 3, tree.first_node.right.right.right.depth
  # end

  def test_it_can_find_a_value
    tree = Tree.new("test_files/input_test_2.txt")
    tree.map_data_to_tree(tree.create_array_from_input)
    assert_equal "9 was found.", tree.find_value(9)
  end

  def test_it_doesnt_find_values_that_dont_exist
    tree = Tree.new("test_files/input_test_2.txt")
    tree.map_data_to_tree(tree.create_array_from_input)
    assert_equal "5 was not found.", tree.find_value(5)
  end

  def test_it_records_depth
    tree = Tree.new("test_files/input_test_2.txt")
    tree.map_data_to_tree(tree.create_array_from_input)
    assert_equal 3, tree.first_node.right.right.right.depth
    assert_equal 5, tree.first_node.right.right.right.right.left.depth
  end

  def test_it_prints_one_node_trees
    skip
    tree = Tree.new("test_files/input_test_3.txt")
    tree.map_data_to_tree(tree.create_array_from_input)
    assert_equal 5,  tree.print_tree
  end

  def test_it_prints_two_node_trees
    skip
    tree = Tree.new("test_files/input_test_1.txt")
    tree.map_data_to_tree(tree.create_array_from_input)
    assert_equal 5,  tree.print_tree
  end

  def test_can_order_3_values
    tree = Tree.new("test_files/input_test_5.txt")
    tree.map_data_to_tree(tree.create_array_from_input)
    assert_equal [4,5,6],  tree.order_values
  end

  def test_can_order_8_values
    tree = Tree.new("test_files/input_test_4.txt")
    tree.map_data_to_tree(tree.create_array_from_input)
    assert_equal [4,5,6,7,10,14,15,16],  tree.order_values
  end
  


end
