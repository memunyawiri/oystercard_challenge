require './lib/oystercard'
require './lib/station'

=begin commented out as raised errors break code when running rspec

oystercard = Oystercard.new
p oystercard
station1 = Station.new("Victoria", 2)
p station1
station2 = Station.new("Shadwell", 1)
p station2
p oystercard.balance
p oystercard.touch_in(station1)
p oystercard.top_up(20)
oystercard.touch_in(station1)
oystercard.touch_out(station2)
oystercard.touch_out(station2)
p oystercard.journeys
p oystercard.balance
oystercard.top_up(90)
p oystercard
p oystercard.balance
=end
