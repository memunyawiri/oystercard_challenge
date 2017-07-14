require_relative "station"
require_relative "journey"

class Oystercard

  MAXIMUM_BALANCE = 90
  #MINIMUM_BALANCE = 1 shouldn't be using MINIMUM_FARE should be using MINIMUM_BALANCE and update test

  attr_reader :balance, :journeys, :current_journey

  def initialize
    @balance = 0
    @journeys = []#JourneyLog.new
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded." if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "You have insufficient funds." if balance < Journey::MINIMUM_FARE
    deduct(current_journey.fare) unless journey_validator
    @current_journey = Journey.new(station)
  end

  def touch_out(station)
    journey_ender(station)
    deduct(current_journey.fare)
    record_journeys
  end

  def record_journeys
    @journeys << current_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def journey_validator
    current_journey.nil? || current_journey.complete?
  end

  def journey_ender(station)
    @current_journey = Journey.new(nil) if journey_validator
    current_journey.end_journey(station)
  end
end
