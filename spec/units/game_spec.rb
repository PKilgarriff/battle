require 'game'

describe Game do
  let(:player_class) { double(:player_class) }
  subject(:game) { Game.new(player_class) }
 
  it 'creates a new Game with 2 players' do
    expect(game.players.size).to eq 0
  end

  describe 'instance' do
    it 'creates a new game' do
      expect(Game.instance).to_not be(game)
      expect(Game.instance).to be_instance_of(Game)
    end

    it 'returns itself' do
      game2 = Game.instance
      expect(Game.instance).to be game2
    end

  end

end