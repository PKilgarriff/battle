require 'game'

describe Game do
  let(:player_class) { double(:player_class) }
  subject(:game) { Game.new(player_class) }
 
  it 'creates a new Game with 2 players' do
    expect(game.players.size).to eq 0
  end

  describe '#attack' do
    it 'allows a player to attack another player' do
      player2 = double(:player2_double)
      expect(player2).to receive(:take_hit).with(10)
      game.attack(player2)
    end
  end

  describe '.instance' do
    it 'creates a new game' do
      expect(Game.instance).to_not be(game)
      expect(Game.instance).to be_instance_of(Game)
    end

    it 'returns itself' do
      game2 = Game.instance
      expect(Game.instance).to be game2
    end

  end

  describe '#new_player' do
    it 'adds a player to the players array' do
      allow(player_class).to receive(:new).with('Dave')
      expect { game.new_player('Dave') }.to change { game.players.count }.by(1)
    end
  end

  describe '#reset_players' do
    it 'empties the players array' do
      allow(player_class).to receive(:new).with('Dave')
      game.new_player('Dave')
      game.reset_players
      expect(game.players).to eq []
    end
  end
end