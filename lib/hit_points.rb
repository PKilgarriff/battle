class HitPoints

  attr_reader :count

  def initialize(count = 0)
    @count = count
  end
  
  def decrease(number)
    @count -= number
  end
end