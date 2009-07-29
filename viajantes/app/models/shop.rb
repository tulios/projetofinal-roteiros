class Shop < ActiveRecord::Base
	# String: name
	# String: address
	# String: phone
	# String: description
	# String: key_words
	# City: city
	# TouristSight: tourist_sight

  belongs_to :city
  belongs_to :tourist_sight

	validates_presence_of :city, :name, :address
end
