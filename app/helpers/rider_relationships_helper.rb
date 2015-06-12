module RiderRelationshipsHelper
  def last_rider
    rider = RiderRelationship.last.passenger
  end
end
