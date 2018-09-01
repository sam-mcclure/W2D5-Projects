class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  attr_reader :head_node, :tail_node
  def initialize
    @head_node = Node.new
    @tail_node = Node.new
    @head_node.next = @tail_node
    @tail_node.prev = @head_node
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head_node.next
  end

  def last
    @tail_node.prev
  end

  def empty?
    return true if @head_node.next == @tail_node
    false
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.prev = @tail_node.prev
    @tail_node.prev.next = new_node
    @tail_node.prev = new_node
    new_node.next = @tail_node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
