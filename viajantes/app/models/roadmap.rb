class Roadmap < ActiveRecord::Base
	#String: title
	#Text: description
	#City: city
	belongs_to :city

end
