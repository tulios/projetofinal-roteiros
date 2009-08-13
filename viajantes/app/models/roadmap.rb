class Roadmap < ActiveRecord::Base
	#String: title
	#Text: description
	#City: city
	#Boolean: public

	belongs_to :city
	belongs_to :user

	validates_presence_of :city_id, :title

	def self.find_like_title(value, per_page = 10, page = 1)
		cond = ["Lower(title) like ? and public = ?", "%#{value.downcase}%", "#{true}"]
		Roadmap.paginate(:conditions => cond, 
										 :per_page => per_page, 
										 :page => page)
	end

end
