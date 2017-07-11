require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }

  describe 'Oystercard has intial balance' do
    it 'has a balance of zero' do
      expect(subject.balance).to eq(0)
    end
  end
  describe '#top_up' do
    it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded."
    end
  end
end
