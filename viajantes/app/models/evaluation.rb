class Evaluation < ActiveRecord::Base
	# Text: criticism
	# City: city
	# User: user
	# Integer: general
	# Integer: service
	# Integer: clean
	# Integer: location
	# Integer: price
	# Integer: infrastructure
	# Integer: attendance
	
	belongs_to :user
  belongs_to :city
  
  @@rates = [:general, :service, :clean, :location, :price, :infrastructure, :attendance]
  
	validates_presence_of :user_id, :city_id, :criticism
  
  def self.rates
  	@@rates
  end
  
  def fill_rates(hash)
  	Evaluation.rates.each do |rate|
  		if hash[rate] and hash[rate].length > 0
  			self[rate] = hash[rate].to_i
  		end
  	end
  end
end
