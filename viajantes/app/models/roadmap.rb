class Roadmap < ActiveRecord::Base
	#String: title
	#Text: description
	#City: city
	#Boolean: public

	belongs_to :city
	belongs_to :user
	has_many :destinations, :order => "start_date", :limit => 10

	validates_presence_of :city_id, :title

	def self.find_like_title(value, per_page = 10, page = 1)
		cond = ["Lower(title) like ? and public = ?", "%#{value.downcase}%", "#{true}"]
		Roadmap.paginate(:conditions => cond, 
										 :per_page => per_page, 
										 :page => page)
	end

  def total_planned_cost
    cost = 0.0
    
    if destinations.length > 0
      destinations.each do |dest|
        cost += dest.planned_cost
      end
    end
    
    cost      
  end
  
  def total_actual_cost
     cost = 0.0
    
    if destinations.length > 0
      destinations.each do |dest|
        cost += dest.total
      end
    end
    
    cost
  end
  
  def balance
    total_planned_cost - total_actual_cost
  end

	def total_of_days
		total = 0
				
		if destinations.length > 0
      destinations.each do |destination|
        total += destination.number_of_days
      end
    end
		
		total
	end

end


















