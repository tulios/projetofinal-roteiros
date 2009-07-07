class TouristSight < ActiveRecord::Base
	#String: name
	#String: address
	#String: description
	#City: city

	belongs_to :city
	has_many :tourist_sight_tag
	has_many :tags, :through => :tourist_sight_tag
	has_many :tips

	validates_presence_of :city, :name, :address

	def save_tags(new_tags)
		TouristSightTag.destroy_all(:tourist_sight_id => id)

		new_tags.each do |tag|
			tst = TouristSightTag.new
			tst.tourist_sight = self
			tst.tag = tag
			tst.save
		end

	end
	
	def self.find_all_by_city_and_tag(city_id, tag_id)
		TouristSight.all(:conditions => ["city_id = ? and tags.id = ?", city_id, tag_id], :joins => :tags)
	end
end













