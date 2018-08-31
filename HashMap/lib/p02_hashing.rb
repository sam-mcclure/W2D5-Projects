require "json"
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    i = self.to_json.object_id
    self.to_s.to_json.object_id + i
  end
end

class String
  def hash
    i = self.to_json.object_id/1000
    self.to_s.to_json.object_id + i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    i = self.to_json.object_id/1000
    self.to_s.to_json.object_id + i
  end
end

def to_h(a)
  ans = 0  
  a.to_s.bytes.each do |num|  
    ans += num.to_s(a.to_s.length).to_i    
  end  
  ans  
end  


def hashing(var)
  i = var.to_json.object_id/1000
  var.to_s.to_json.object_id + i
end 