require 'hit_points'

describe HitPoints do
  it 'initializes with a hit point value of 0' do
    hit_points = HitPoints.new
    expect(hit_points.count).to eq 0
  end
end
