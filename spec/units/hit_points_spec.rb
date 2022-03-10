require 'hit_points'

describe HitPoints do
  subject(:hit_points) { described_class.new }

  it 'initializes with a hit point value of 0' do
    expect(hit_points.count).to eq 0
  end

  it 'can be decreased' do
    expect { hit_points.decrease(5) }.to change { hit_points.count }.by -5
  end
end
