require 'oystercard'

describe Oystercard do

  subject(:card) { described_class.new }
  let(:station){double :station}
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
#  let(:journey){ double :journey }

  describe 'Oystercard has initial balance' do
    it 'has a balance of zero' do
      expect(card.balance).to eq(0)
    end
  end
  describe 'Oystercard stores journeys' do
    it 'has an empty list of journeys by default' do
      expect(card.journeys).to be_empty
    end
  end
  describe '#top_up' do
    it 'can be topped up' do
      expect { card.top_up(1) }.to change { card.balance }.by(1)
    end
    it 'raises an error if the maximum top_up balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      card.top_up(maximum_balance)
      expect { card.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded."
    end
  end
  describe '#touch_in' do
    it 'raises an error if it touches in with insufficient funds' do
      expect { card.touch_in(entry_station) }.to raise_error "You have insufficient funds."
    end
    context 'in journey' do
      it 'stores a journey\'s entry station' do
        card.top_up(4)
        card.touch_in(entry_station)
        card.touch_out(exit_station)
        expect(card.journeys.last.entry_station).to eq entry_station
      end
      it 'stores a journey\'s exit station' do
        card.top_up(4)
        card.touch_in(entry_station)
        card.touch_out(exit_station)
        expect(card.journeys.last.exit_station).to eq exit_station
      end
    end
  end
  describe '#touch_out' do

    before do
      card.top_up(20)
      card.touch_in(entry_station)
    end

    it 'deducts minimum fair from balance on touch out' do
      expect { card.touch_out(exit_station) }.to change { card.balance }.by(-Oystercard::MINIMUM_BALANCE)
    end
    it 'can store multiple journeys' do
      card.touch_out(exit_station)
      card.touch_in(exit_station)
      card.touch_out(entry_station)
      expect(card.journeys.length).to eq 2
    end
  end
end
