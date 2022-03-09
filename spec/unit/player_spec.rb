require 'player'

describe Player do
  let(:hp_double) { double(:hp_double) }

  it 'stores a name' do
    player1 = Player.new('Dave')
    expect(player1.name).to eq 'Dave'
  end

  describe '#hit_points' do
    it 'reports current hit points' do
      player1 = Player.new('Dave', hp_double)
      allow(hp_double).to receive(:count).and_return(7)
      expect(player1.hit_points).to eq 7
    end
  end

  describe '#take_hit' do
    it 'reduces hit points by the number given' do
      hp_spy = spy(:hp_spy)
      player1 = Player.new('Dave', hp_spy)
      player1.take_hit(10)
      expect(hp_spy).to have_received(:decrease).with(10)
    end
  end
end