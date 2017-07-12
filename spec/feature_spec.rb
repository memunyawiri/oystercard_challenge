require './lib/oystercard'

oystercard = Oystercard.new
station = Station.new
oystercard.top_up(4)
oystercard.touch_in(station)
p oystercard
oystercard.balance
p oystercard
oystercard.top_up(20)
p oystercard
oystercard.touch_in
p oystercard
oystercard.touch_out
p oystercard
