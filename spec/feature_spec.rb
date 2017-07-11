require './lib/oystercard'

oystercard = Oystercard.new
p oystercard
oystercard.balance
p oystercard
oystercard.top_up(20)
p oystercard
oystercard.deduct(10)
p oystercard
