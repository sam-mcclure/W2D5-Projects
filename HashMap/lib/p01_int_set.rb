class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false) 
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num) 
    @store[num] = true
    # return true 
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] 
  end

  private

  def is_valid?(num)
    return false if num < 0
    return true if num <= @store.length - 1
    false 
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % num_buckets
    @store[i] << num
  end

  def remove(num)
    i = num % num_buckets
    @store[i].delete(num)
  end

  def include?(num)
    i = num % num_buckets
    return true if @store[i].any?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self[num].include?(num)
      @count += 1
      resize! if @count > num_buckets
      self[num] << num 
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end 
  end

  def include?(num)
    self[num].any?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    i = num % num_buckets
    @store[i]
  end

  def num_buckets
    @store.length
  end

    #Is this n^2 or n?
  def resize!
    new_store = Array.new(num_buckets*2) { Array.new }
    @store.each do |bucket|
      bucket.each do |el|
        i = el % new_store.length
        new_store[i] << el
      end 
    end
    @store = new_store
  end
end
