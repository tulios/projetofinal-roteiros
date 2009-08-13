class Destination < ActiveRecord::Base
  
  # Float: planned_cost
  # Date: start
  # Date: end
  # Vehicle: vehicle
  # Roadmap: road_map
  # City: city
  
  belongs_to :roadmap
  belongs_to :vehicle
  belongs_to :city
  
  validates_presence_of :roadmap, :city
end
