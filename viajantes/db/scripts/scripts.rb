module Scripts
	# Nome do banco
	DB_NAME = "viajantes"
	USER_NAME = "viajantes"
	SCRIPTS_DIR = "db/scripts/"

	def self.load
		puts "Dropando schema e recriando tabelas com rake"
		system ("rake -q db:schema:load")
	
		puts "Scripts:"
		Dir.entries(SCRIPTS_DIR).sort.each do |file|
			if sql?(file)
				self.execute_postgres_script!(file)
			end
		end
	end

	private
	def self.sql?(file)
		return file =~ /.*\.sql$/
	end	

	def self.execute_postgres_script!(script)
		command = "psql -q -f #{SCRIPTS_DIR}#{script} -U #{USER_NAME} -d #{DB_NAME}"
		puts "Executando: #{script}"

		if system(command)
			puts "\tScript executado com sucesso"
		else
			puts "\tFalha ao executar script"
		end
	end

end





























