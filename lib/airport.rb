require_relative "weather"
require_relative "plane"


class Airport

    attr_reader :planes

    DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather
  end

  def land_plane(plane)
    raise "This airport is full to capacity, please go to the next nearest airport to land" if full?
    raise "There is a storm at destination please divert to nearest airport" if stormy?
    plane.plane_landed(self)
    planes << plane

  end

  def take_off(plane)
    raise "All planes are grounded until further notice due to bad weather" if stormy?
    raise "Plane cannot take off as it is not currently in this airport" if planes_in_airport(plane)
    plane.take_off
    planes.pop
    plane
 end

private

attr_reader :capacity, :weather

  def full?
    planes.count >= capacity
  end

  def stormy?
    weather.new.stormy?
  end

  def planes_in_airport(plane)
    !planes.include? plane
  end

end
