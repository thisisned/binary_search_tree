class Node
  attr_accessor :value, :lchild, :rchild
  
  def initialize (value, lchild = nil, rchild = nil)
    @value = value
    @lchild = lchild
    @rchild = rchild
  end
  
end

class Tree
  attr_accessor :root
  
  def initialize(data)
    @root = nil
    build_tree(data)
  end
  
  def build_tree(data)
    @root = Node.new(data.shift) if @root.nil?
    data.each do |value|
      node = Node.new(value)
      insert_node(node)
    end
  end
  
  def insert_node(new_node, current_node = @root)
    if new_node.value <= current_node.value
      if current_node.lchild.nil?
        current_node.lchild = new_node
      else
        insert_node(new_node, current_node.lchild)
      end
    elsif current_node.rchild.nil?
      current_node.rchild = new_node
    else
      insert_node(new_node, current_node.rchild)
    end
  end
  
  def breadth_first_search(value)
    queue = []
    queue << @root
    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == value
      queue << current_node.lchild unless current_node.lchild.nil?
      queue << current_node.rchild unless current_node.rchild.nil?
    end
    puts "Value not found"
    nil
  end
  
  def depth_first_search(value)
    stack = []
    stack << @root
    until stack.empty?
      current_node = stack.pop
      return current_node if current_node.value == value
      stack << current_node.lchild unless current_node.lchild.nil?
      stack << current_node.rchild unless current_node.rchild.nil?
    end
    puts "Value not found"
    nil
  end
  
  def dfs_rec(value, current_node = @root)
    return nil if current_node.nil?
    puts "Searching node value: " + current_node.value.to_s
    return current_node if current_node.value == value
    dfs_rec(value, current_node.lchild) unless current_node.lchild.nil?
    dfs_rec(value, current_node.rchild) unless current_node.rchild.nil?
  end
    
end
  
  
def build_tree_sorted (data)
  return nil if data.empty? # Base case
  return Node.new(data[0]) if data.length == 1 # If only one element
  mid = (data.length / 2) # Find middle
  tree = Node.new(data[mid])
  tree.lchild = build_tree_sorted(data[0..mid-1])
  tree.rchild = build_tree_sorted(data[mid+1..-1])
  tree
end