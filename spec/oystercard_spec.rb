require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }

  describe 'Oystercard has initial balance' do
    it 'has a balance of zero' do
      expect(subject.balance).to eq(0)
    end
  end
  describe '#top_up' do
    it 'can top up the balance' do
      expect { subject.top_up(1) }.to change { subject.balance }.by(1)
    end
    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded."
    end
  end
  describe '#deduct' do
    it 'deducts amount from balance' do
      subject.top_up(20)
      expect { subject.deduct(10) }.to change { subject.balance }.by(-10)
    end
  end
  context 'checking for Oystercard activity' do
    it 'is in use' do
      expect(subject).not_to be_in_journey
    end
  end
  describe '#touch_in' do
    it 'touches in' do
      subject.top_up(10)
      expect(subject.touch_in).to eq true
    end
    it 'raises an error if oystercard has insufficient funds' do
      expect { subject.touch_in }.to raise_error "You have insufficient funds."
    end
  end
  describe '#touch_out' do
    it 'touches out' do
      expect(subject.touch_out).to eq false
    end
  end
end
