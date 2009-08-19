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

	has_many :programs
  
  validates_presence_of :roadmap, :city

	def total
		sum = 0.0

		programs.each do |program|
			sum += program.value
		end

		sum
	end

	def balance
		planned_cost - total
	end
end
