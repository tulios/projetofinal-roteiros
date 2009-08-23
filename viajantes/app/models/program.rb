class Program < ActiveRecord::Base

	# Destination: destination
	# Date: date
	# Float: value
	# Text: description
	# TouristSigh: tourist_sight
	# Shop: shop	
	
	belongs_to :destination

  belongs_to :tourist_sight
  belongs_to :shop

	validates_format_of 	:date, :with =>  /\A\d{4}\-\d{2}\-\d{2}\Z/
	validates_presence_of :date, :value, :destination_id
end
