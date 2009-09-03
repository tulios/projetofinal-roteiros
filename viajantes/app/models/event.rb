class Event < ActiveRecord::Base

	# City: city
	# String: name
	# Time: time
	# TouristSight: tourist_sight
	# Shop: shop
	# Boolean: cost
	# String: description

  belongs_to :city
  belongs_to :tourist_sight
  belongs_to :shop

	validates_presence_of :city_id, :name, :time

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
