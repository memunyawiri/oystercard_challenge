require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }
  let(:station){double :station}

  describe 'Oystercard has initial balance' do
    it 'has a balance of zero' do
      expect(card.balance).to eq(0)
    end
  end
  describe '#top_up' do
    it 'can top up the balance' do
      expect { card.top_up(1) }.to change { card.balance }.by(1)
    end
    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      card.top_up(maximum_balance)
      expect { card.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded."
    end
  end
  context 'checking for Oystercard activity' do
    it 'is in use' do
      expect(card).not_to be_in_journey
    end
  end
  describe '#touch_in' do
    it 'touches in' do
      card.top_up(10)
      card.touch_in(station)
      expect(card).to be_in_journey
    end
    it 'raises an error if oystercard has insufficient funds' do
      expect { card.touch_in(station) }.to raise_error "You have insufficient funds."
    end
    it 'stores the entry station' do
      card.top_up(4)
      card.touch_in(station)
      expect(card.entry_station).to eq station
    end
  end
  describe '#touch_out' do
    it 'touches out' do
      card.touch_out
      expect(card).not_to be_in_journey
    end
    it 'deducts minimum fair from balance on touch out' do
      card.top_up(1)
      card.touch_in(station)
      expect { card.touch_out }.to change { card.balance }.by(-Oystercard::MINIMUM_FAIR)
    end
  end
end
