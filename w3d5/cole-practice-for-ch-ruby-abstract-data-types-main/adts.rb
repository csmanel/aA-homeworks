class Stack
  attr_reader :stored

  def initialize
    @stored = []
  end

  def push(el)
    stored.push(el)
    el
  end

  def pop
    stored.pop
  end

  def peek
    stored.last
  end
end

class Queue
  attr_reader :stored

  def initialize
    @stored = []
  end

  def enqueue(el)
    stored.push(el)
    el
  end

  def dequeue
    stored.shift
  end

  def peek
    stored.first
  end
end

class Map
  attr_reader :stored

  def initialize
    @stored = []
  end

  def set(key, val)
    indx = stored.index {|pair| pair[0] == key}
    if indx
      stored[indx][1] = val
    else
      stored.push([key, val])
    end
    val
  end

  def get(key)
    stored.each {|pair| pair[1] if pair[0] == key}
    nil
  end

  def delete(key)
    val = get(key)
    stored.reject! {|pair|pair[0] == key}
    val
  end

  def show
    deep_dup(stored)
  end
  
  def deep_dup(arr)
    arr.map {|el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end

