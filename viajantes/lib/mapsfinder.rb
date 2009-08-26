module MapsFinder

	def self.find_city(city)
		address = "#{city.state.country.name}, #{city.state.name}, #{city.name}"
		get_geocode(address)
	end

	private
	def self.get_geocode(address)
		geocode = Geocoding.get(address)
		if geocode and geocode.length > 0
			latitude = geocode[0][:latitude]
			longitude = geocode[0][:longitude]
		
			return{:latitude => latitude, :longitude => longitude}
		end
		nil
	end
	
end




















