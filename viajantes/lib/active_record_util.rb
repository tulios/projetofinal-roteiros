module ActiveRecordUtil

	# Monta uma query a partir das condições e dos valores passados por parametro
  #
  def self.prepare_condition(query, att)
  	condition = []
		joined_query = ""
		
		# Concatenando as querys
		query.each do |q|
			joined_query << "#{q} and "
		end
		
		# Retira o ultimo and que sobrar
		joined_query.strip!.gsub!(/and\Z/, '')
		condition << joined_query
		
		# Aplicando atributos para cada ?
		att.each do |a|
			condition << a
		end
		
		condition
  end

end
