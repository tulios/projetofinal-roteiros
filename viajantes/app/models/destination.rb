class Destination < ActiveRecord::Base
  belongs_to :road_map
  belongs_to :vehicle
  belongs_to :city
  
  validates_presence_of :road_map, :city
end
