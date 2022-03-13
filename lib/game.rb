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

  def attack
    defender = @players[1]
    defender.take_hit(10)
    switch_players
  end

  def reset_players
    @players = []
  end

  def switch_players
    @players.reverse!
  end

  def self.instance(player_class = Player)
    @game ||= Game.new(player_class)
  end

end