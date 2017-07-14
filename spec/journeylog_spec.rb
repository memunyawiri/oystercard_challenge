require 'journeylog'

describe JourneyLog do

  subject(:journeylog) { described_class.new }
  let(:station1) { double(:station, :name => "Victoria", :zone => 2) }
  let(:station2) { double(:station, :name => "Whitechapel", :zone => 1) }

  describe 'initialize' do
    it 'does not have any journeys to begin with' do
      expect(journeylog.journeys).to be_empty
    end
  end

  describe '#start' do
    it 'should start a journey with an entry station' do
      journeylog.start(station1)
      expect(journeylog.journeys.last.entry_station).to eq station1
    end
  end
  describe '#finish' do
    it 'should finish a journey with exit station' do
      journeylog.finish(station2)
      expect(journeylog.journeys.last.exit_station).to eq station2
    end
  end
end
