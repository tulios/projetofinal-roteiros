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

	def self.find_like_name(value, per_page, page)
		cond = ["Lower(name) like ? or Lower(key_words) like ?", "%#{value.downcase}%", "%#{value.downcase}%"]
		Shop.paginate(:conditions => cond, 
									:per_page => per_page, 
									:page => page)
	end
end
