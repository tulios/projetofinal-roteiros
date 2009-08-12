class TouristSight < ActiveRecord::Base
	#String: name
	#String: address
	#String: description
	#City: city
	#User: user

	belongs_to :city
	belongs_to :user
	has_many :tourist_sight_tag
	has_many :tags, :through => :tourist_sight_tag
	has_many :tips, :order => "created_at desc", :limit => 10

	validates_presence_of :city_id, :name, :address

	def save_tags(new_tags)
		TouristSightTag.destroy_all(:tourist_sight_id => id)

		new_tags.each do |tag|
			tst = TouristSightTag.new
			tst.tourist_sight = self
			tst.tag = tag
			tst.save
		end

	end
	
	def increase_hits
	  self.update_attributes(:hits => self.hits + 1)
	end
	
	def self.find_all_by_city_and_tag(city_id, tag_id, per_page = 10, page = 1)
		TouristSight.paginate(:conditions => ["city_id = ? and tags.id = ?", city_id, tag_id], 
													:joins => :tags,
													:per_page => per_page,
													:page => page)
	end

	def self.find_like_name(value, per_page = 10, page = 1)
		TouristSight.paginate(:conditions => ["Lower(name) like ?", "%#{value.downcase}%"], 
													:per_page => per_page, 
													:page => page)
	end
end













