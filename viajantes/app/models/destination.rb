class Destination < ActiveRecord::Base
  
  # Float: planned_cost
  # Date: start_date
  # Date: end_date
  # Vehicle: vehicle
  # Roadmap: road_map
  # City: city
  
  # Roadmap: road_map
  # City: city
  # Vehicle: vehicle
  # Date: start_date
  # Date: end_date
  # Float: planned_cost
  
  belongs_to :roadmap
  belongs_to :vehicle
  belongs_to :city
  
  has_many :programs
  
  validates_presence_of :roadmap, :city_id
  validates_presence_of :start_date, :if => "not end_date.nil?"
  validates_presence_of :end_date, :if => "not start_date.nil?"
  
  def validate
    errors.add(:end_date, "deve ser antes da data se início.") if end_date < start_date
  end 
  
  def number_of_days
    end_date - start_date
  end
  
end
