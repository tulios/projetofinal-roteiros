#Conversores
module Converters

	# Currency to float
	def self.currency_to_number(currency)
		if valid_string?(currency)
	  	return currency.gsub(/[\.]/, '').gsub(/[,]/, '.').gsub(/[A-Z]/, '').gsub(/[$]/, '').gsub(/[\s]/, '').to_f
		else
			return nil
		end
	end

	# String to date
	def self.to_date(string, just_date = false, delimiter = '/')
		begin
			if just_date
				return string_to_date(string, delimiter)
			else
				return string_to_datetime(string, delimiter)
			end

		rescue
			return nil
		end

		return nil
	end
	   
	# Date to String
	def self.date_to_string(date)
	  if date
	    date.strftime("%d/%m/%Y")
	  end
	end

	private
	# Verifica se é uma string
	def self.string?(string)
		string.class == String
	end
	
	# Verifica se uma string é valida
	def self.valid_string?(string)
		string and string?(string) and string.length > 0
	end

	# Converte uma string para DateTime
	def self.string_to_datetime(string, delimiter)

		if valid_string?(string)
			array = string.split(delimiter)
		  return DateTime.new(array[2].to_i,array[1].to_i,array[0].to_i)
		end

		nil

	end
	
	# Converte uma string para Date
	def self.string_to_date(string, delimiter)

		if valid_string?(string)
			array = string.split(delimiter)
		  return Date.new(array[2].to_i,array[1].to_i,array[0].to_i)
		end

		nil

	end
	
end




















