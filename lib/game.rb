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

  def attack(player2)
    player2.take_hit(10)
  end

  def reset_players
    @players = []
  end

  def self.instance(player_class = Player)
    @game ||= Game.new(player_class)
  end

end