class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FAIR = 1

  attr_reader :balance
  attr_reader :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded." if amount + @balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    raise "You have insufficient funds." if @balance < MINIMUM_FAIR
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_FAIR)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
