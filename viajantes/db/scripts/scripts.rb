module Scripts
	# Nome do banco
	DB_NAME = "viajantes"
	USER_NAME = "viajantes"
	SCRIPTS_DIR = "db/scripts/"
	DUMPS_DIR = "db/dumps/"

	def self.load
		load_schema
	
		puts "Scripts:"
		Dir.entries(SCRIPTS_DIR).sort.each do |file|
			if sql?(file)
				self.execute_script!(file)
			end
		end
	end   
	
	def self.load_dump
	  create_database
		
    dumps = Dir.entries(DUMPS_DIR).sort
    # Ultimo
    file = "20091019.sql" #dumps[dumps.length - 1] 
    
    puts "Dump escolhido: #{file}, executando..." 
		if sql?(file)
			self.execute_script!(file, DUMPS_DIR)
		end  
	end
         
  # Metodos privados #########################################################

	private  
	def self.create_database
	  puts "Dropando tudo"
		system ("rake -q db:drop:all")
		puts "Recriando database"
		system ("rake -q db:create:all")
	end
	 
	def self.load_schema
	  puts "Dropando schema e recriando tabelas com rake"
		system ("rake -q db:schema:load")
	end
	
	def self.sql?(file)
		return file =~ /.*\.sql$/
	end	

	def self.execute_script!(script, dir = SCRIPTS_DIR)
		puts "Executando: #{script}"
		
		sql = ""
		File.open("#{dir}#{script}", "r").each do |line|
			sql << line
		end

		Scripts.execute(sql)
	end
	
	# Executa o sql passado
	#
	def self.execute(sql)
		begin
			con = ActiveRecord::Base.connection()
			con.begin_db_transaction
			con.execute(sql)
			con.commit_db_transaction
			
			puts "-> Sql executado com sucesso!"
		rescue StandardError => e
			puts "-> Falha ao executar sql. (#{e})"
		end
	end

end





























