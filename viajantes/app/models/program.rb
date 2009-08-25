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

	attr_accessor :happens_in
	@@happens_in_options = {:tourist_sight => "Ponto Turístico",
													:shop => "Estabelecimento",
													:another => "Outro"}

	def self.happens_in_options
		@@happens_in_options
	end

	def happens_in
		if tourist_sight
			@happens_in = :tourist_sight
		elsif shop
			@happens_in = :shop
		else
			@happens_in = :another 
		end

		@happens_in
	end
	
end
















