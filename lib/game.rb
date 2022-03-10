require_relative './player'

class Game

  attr_reader :players

  def initialize(player_class)
    @players = []
    @player_template = player_class
  end

  def new_player(name)
    @players << @player_template.new(name)
  end

  def self.instance(player_class = Player)
    @game ||= Game.new(player_class)
  end

end