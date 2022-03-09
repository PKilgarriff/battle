require_relative './hit_points'

class Player
  attr_reader :name

  def initialize(name, hit_points = HitPoints.new)
    @name = name
    @hit_points = hit_points
  end

  def hit_points
    @hit_points.count
  end

  def take_hit(number)
    @hit_points.decrease(number)
  end
end