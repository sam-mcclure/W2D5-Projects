class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    
    if !include?(key)
      @count += 1 
      resize! if @count > num_buckets
      self[key] << key 
    end 
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    hash = num.hash 
    i = hash % num_buckets
    @store[i]
  end

  def num_buckets
    @store.length
  end

  # is flattening one time best because then you'll account for arrays as well
  def resize!
    new_store = Array.new(num_buckets * 2) {Array.new}
    @store.flatten(1).each do |el|
      hash = el.hash 
      i = hash % new_store.length 
      new_store[i] << el 
    end
    @store = new_store
  end 
  

end
