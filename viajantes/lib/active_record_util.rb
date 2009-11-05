module ActiveRecordUtil

	# Monta uma query a partir das condições e dos valores passados por parametro
  #
  def self.prepare_condition(query, att)
  	condition = []
		joined_query = ""
		                 
		# Caso nao tenha query nao tem condicao                
		if query.nil? or query.length == 0
		  return condition
	  end
		
		# Concatenando as querys
		query.each do |q|
		  unless q.empty? then joined_query << "#{q} and " end
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
