require_relative "station"
require_relative "journey"

class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance, :entry_station, :exit_station, :journeys, :current_journey

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded." if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "You have insufficient funds." if balance < Journey::MINIMUM_FARE
    deduct(current_journey.fare) unless current_journey.nil? || current_journey.complete?
    @current_journey = Journey.new(station)
  end

  def touch_out(station)
    @current_journey = Journey.new(nil) if current_journey.nil? || current_journey.complete?
    current_journey.end_journey(station)
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

end
