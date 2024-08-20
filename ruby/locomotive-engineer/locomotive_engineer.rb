class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons) = wagons

  def self.fix_list_of_wagons(train_one, train_two)
    second_to_last, last, first, *rest = train_one
    [first, *train_two, *rest, second_to_last, last]
  end

  def self.add_missing_stops(route, **stops) = { **route, stops: stops.values }

  def self.extend_route_information(route, info) = { **route, **info }
end
