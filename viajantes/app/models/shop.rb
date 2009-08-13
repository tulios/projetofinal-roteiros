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

	validates_presence_of :city_id, :name, :address

  def increase_hits
	  self.update_attributes(:hits => self.hits + 1)
	end

	def self.find_like_name_or_key_word(value, per_page = 10, page = 1)
		cond = ["Lower(name) like ? or Lower(key_words) like ?", "%#{value.downcase}%", "%#{value.downcase}%"]
		Shop.paginate(:conditions => cond, 
									:per_page => per_page, 
									:page => page)
	end
end
