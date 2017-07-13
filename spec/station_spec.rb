require 'station'

describe Station do
  subject(:station) { described_class.new("Victoria", "2") }

  it "returns it's name" do
    expect(station.station_name).to eq "Victoria"
  end
  it "returns it's zone" do
    expect(station.station_zone).to eq "2"
  end
end
