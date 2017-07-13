class Station
  attr_reader :station_name, :station_zone

  def initialize(station, zone)
    @station_name = station
    @station_zone = zone
  end
end
