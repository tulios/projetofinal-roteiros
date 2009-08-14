class Destination < ActiveRecord::Base
  
  # Float: planned_cost
  # Date: start_date
  # Date: end_date
  # Vehicle: vehicle
  # Roadmap: road_map
  # City: city
  
  belongs_to :roadmap
  belongs_to :vehicle
  belongs_to :city
  
  validates_presence_of :roadmap, :city
end
