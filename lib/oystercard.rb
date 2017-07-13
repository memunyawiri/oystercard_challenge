require_relative "station"

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FAIR = 1

  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded." if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "You have insufficient funds." if balance < MINIMUM_FAIR
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FAIR)
    @exit_station = station
    record_journeys
  end

  def record_journeys
    @journeys << {entry_station: entry_station, exit_station: exit_station }
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
