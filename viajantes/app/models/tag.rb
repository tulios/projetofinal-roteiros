class Tag < ActiveRecord::Base
	#String: name

	validates_presence_of :name
	validates_uniqueness_of :name
	validates_length_of :name, :in => 4..15
end
