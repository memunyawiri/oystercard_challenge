require 'journey'

describe Journey do
  subject(:journey) { described_class.new("Victoria") }

  describe "initialization" do
    it "should return the station where a journey began" do
      expect(journey.entry_station).to eq "Victoria"
    end
  end

  describe "#end_journey" do
    it "should return the station where a journey ended" do
      expect(journey.end_journey("Camden")).to eq "Camden"
    end
  end

  describe "#complete?" do
    it "should know if a journey is completed" do
      journey.end_journey("Camden")
      expect(journey).to be_complete
    end
  end

  describe "#fare" do
    it "should charge the minimum fare for a completed journey" do
      journey.end_journey("Camden")
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it "should charge a penalty for incomplete journeys" do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end
end
