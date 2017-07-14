# Oystercard Challenge

This challenge was completed during week 3: we were challenged to build a more complex system to stretch our skills in Ruby, TDD and object-oriented design.

## Challenge user stories

Here are the user stories used for this project:

```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

How the application currently works
========================================
```
2.4.0 :001 > require './lib/oystercard'
 => true
2.4.0 :002 > require './lib/station'
 => true
2.4.0 :003 > oystercard = Oystercard.new
 => #<Oystercard:0x007fcab1096860 @balance=0, @journey_log=#<JourneyLog:0x007fcab1096838 @journey_class=Journey, @journeys=[]>>
2.4.0 :004 > station1 = Station.new("Victoria", 2)
 => #<Station:0x007fcab1084d90 @station_name="Victoria", @station_zone=2>
2.4.0 :005 > station2 = Station.new("Shadwell", 1)
 => #<Station:0x007fcab1015800 @station_name="Shadwell", @station_zone=1>
2.4.0 :006 > oystercard.balance
 => 0
2.4.0 :007 > oystercard.touch_in(station1)
RuntimeError: You have insufficient funds.
	from /Users/mutsamunyawiri/Desktop/Projects/oystercard_challenge/lib/oystercard.rb:21:in `touch_in'
	from (irb):7
	from /Users/mutsamunyawiri/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :008 > oystercard.top_up(20)
 => 20
2.4.0 :009 > oystercard.balance
 => 20
2.4.0 :010 > oystercard.touch_in(station1)
 => #<Station:0x007fcab1084d90 @station_name="Victoria", @station_zone=2>
2.4.0 :011 > oystercard.touch_out(station2)
 => 19
2.4.0 :012 > oystercard.journeys
 => [#<Journey:0x007fcab2012a78 @entry_station=#<Station:0x007fcab1084d90 @station_name="Victoria", @station_zone=2>, @exit_station=#<Station:0x007fcab1015800 @station_name="Shadwell", @station_zone=1>>]
2.4.0 :013 > oystercard.journeys
 => [#<Journey:0x007fcab2012a78 @entry_station=#<Station:0x007fcab1084d90 @station_name="Victoria", @station_zone=2>, @exit_station=#<Station:0x007fcab1015800 @station_name="Shadwell", @station_zone=1>>]
2.4.0 :014 > oystercard.touch_out(station1)
 => 13
2.4.0 :015 > oystercard.journeys
 => [#<Journey:0x007fcab2012a78 @entry_station=#<Station:0x007fcab1084d90 @station_name="Victoria", @station_zone=2>, @exit_station=#<Station:0x007fcab1015800 @station_name="Shadwell", @station_zone=1>>, #<Journey:0x007fcab1890458 @entry_station=nil, @exit_station=#<Station:0x007fcab1084d90 @station_name="Victoria", @station_zone=2>>]
2.4.0 :016 > oystercard.balance
 => 13
2.4.0 :017 > oystercard.top_up(90)
 RuntimeError: Maximum balance of 90 exceeded.
 	from /Users/mutsamunyawiri/Desktop/Projects/oystercard_challenge/lib/oystercard.rb:16:in `top_up'
 	from (irb):17
 	from /Users/mutsamunyawiri/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :018 > oystercard.top_up(77)
 => 90

```
#Gems used for this exercise
- GuardSpec - as gem and as Atom package
- Rubocop
- simplecov & simplecov-console
- rake
- reek
- rspec

See Gemfile for filekeys

#Notes on challenges completed
- Challenges 1-15 completed
- 1 offence on rubocop, offence in gemfile - breaks if corrected
- 100% test coverage across all 8 files
- Feature spec included
- I paired with @aballal, @langphil, @bdcraven, @i-hardy & @meta-morpho-sys
