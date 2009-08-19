class Destination < ActiveRecord::Base
  
  # Float: planned_cost
  # Date: start_date
  # Date: end_date
  # Vehicle: vehicle
  # Roadmap: road_map
  # City: city
	# Program: programs
  
	has_many :programs
  
  belongs_to :roadmap
  belongs_to :vehicle
  belongs_to :city
  
  validates_presence_of :roadmap, :city_id
  validates_presence_of :start_date, :if => "end_date"
  validates_presence_of :end_date, :if => "start_date"
  
  def validate
    if(start_date and end_date)
      errors.add(:end_date, "deve ser antes da data se início.") if end_date < start_date
    end
  end 
  
  def number_of_days
    end_date - start_date
  end

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
