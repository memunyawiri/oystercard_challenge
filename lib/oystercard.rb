require_relative 'journeylog'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1 #shouldn't be using MINIMUM_FARE should be using MINIMUM_BALANCE and update test

  attr_reader :balance

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded." if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "You have insufficient funds." if balance < MINIMUM_BALANCE
    deduct(@journey_log.journeys.last.fare) if in_journey?
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(@journey_log.journeys.last.fare)
  end

  def journeys
    @journey_log.journeys.dup
  end

  def in_journey?
    return false if @journey_log.journeys.empty?
    !@journey_log.journeys.last.exit_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
