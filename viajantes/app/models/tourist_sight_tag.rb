class TouristSightTag < ActiveRecord::Base
	#TouristSight: tourist_sight
	#Tag: tag
	
	belongs_to :tourist_sight
  belongs_to :tag
  
  validates_associated :tourist_sight
  validates_associated :tag
end
