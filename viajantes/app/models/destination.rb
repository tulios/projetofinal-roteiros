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
  
end
