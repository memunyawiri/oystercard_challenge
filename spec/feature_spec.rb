require './lib/oystercard'

oystercard = Oystercard.new
#station1 = Station.new
#station2 = Station.new
oystercard.top_up(4)
oystercard.journeys
# => nil
#p oystercard.touch_in(station1)
p oystercard.journeys
#p oystercard.touch_out(station2)
p oystercard.journeys
#{:station1 => station2}
# => [entry_station: station1, exit_station: station2]

#p oystercard
#oystercard.balance
#p oystercard
#oystercard.top_up(20)
#p oystercard
#oystercard.touch_in
#p oystercard
#oystercard.touch_out
#p oystercard
