module Constraints

	FILE_NAME = "constraints.sql"

	# Gera um arquivo com as constraints de banco para os relacionamentos dos modelos.
	# <b>Não aplica as constraints no banco, apenas gera o arquivo.</b>
	#
	def self.generate
		
		loader = ModelLoader.new
		Constraints.generate_file(FILE_NAME, loader.constraints)
		
	end
	
	# Gera constraints de banco baseadas nos relacionamentos dos modelos e 
	# <b>aplica ao banco configurado.</b>
	# 
	def self.load
	
		# Verifica a existencia do arquivo com as constraints
		if File.exist?(FILE_NAME)
			puts "-> #{FILE_NAME} encontrado, carregando constraints"
			lines = File.open(FILE_NAME,"r")
			
			# Lê todas
			sql = ""
			lines.each do |line|
				sql << line
			end
			
		else
			puts "-> #{FILE_NAME} não encontrado, scanneando modelos e gerando constraints"
			# Caso o arquivo não exista, gera as constraints scanneando os modelos
			sql = Constraints.generate
		end
		
		# Aplica as constraints no banco de dados
		Constraints.apply(sql)
	end
	
	# Classe que irá scannear as informações dos models, gerar um mapa com as relações
	# e gerar as constraints para o banco.
	#
	class ModelLoader
		# Métodos que representão relações que serão procurados ao scannear os modelos
		@@tokens = ["belongs_to"]
		
		attr_reader :model_paths, :needs, :constraints
		
		# Construtor
		def initialize(model_dir_path = 'app/models/')
			
			@path = model_dir_path
			@constraints = []
			
			load_model_paths
			map_constraint_needs
			generate_constraints
			
		end
		
		private
		
		# De posse das relações extraidas pelo método <b>map_constraint_needs</b> esse
		# método irá gerar as respectivas constraints.
		#
		def generate_constraints
		
			@needs.keys.each do |key|
				# Recupera o array de relacionamentos
				array = @needs[key]
				
				# Extrai o nome do modelo. Ex: app/models/city.tb -> city
				model_name = 	key.gsub(@path, '').gsub("\.rb", '')
				# De acordo com o padrão do rails as tabelas são o plural dos modelos
				table_name = model_name.pluralize
				
				# Itera cada relação e gera a constraint necessária para obte-la em banco
				array.each do |value|
					new_value = value
					new_association_table = false
					
					# Em caso do mapeamento criar uma associativa não declarada
					if Regexp.new("has_and_belongs_to_many").match(new_value)
						new_value = new_value.gsub("has_and_belongs_to_many", '')
						new_association_table = true
					else
						@@tokens.each do |token|
							new_value = new_value.gsub(token, '')
						end
					end
					
					# Obtem o nome das tabelas donas das chaves estrangeiras
					foreign_table = new_value.split(',')[0].gsub(':', '').strip.lstrip.rstrip
					# E seu plural
					foreign_table_name = foreign_table.pluralize
					
					table_used_name = table_name
					if new_association_table
					  # Em caso de has_and_belongs uma tabela associativa é criada
						table_used_name = "#{foreign_table_name}_#{table_name}"
						# Caso seja has_and_belongs a coluna fica no singular
						foreign_table = foreign_table.singularize
					end
					
					# Gerando a constraint
					@constraints << "ALTER TABLE ONLY #{table_used_name}
    ADD CONSTRAINT fk_#{table_used_name}_#{foreign_table_name} FOREIGN KEY (#{foreign_table}_id) REFERENCES #{foreign_table_name}(id);\n"
    
    			# Em caso de associativa deve-se criar constraints para os 2 lados da relação
    			if new_association_table
    			
    				@constraints << "ALTER TABLE ONLY #{table_used_name}
    ADD CONSTRAINT fk_#{table_used_name}_#{table_name} FOREIGN KEY (#{table_name.singularize}_id) REFERENCES #{table_name}(id);\n"
    			
    			end
						
				end
							
			end
			
		end
		
		# Com base nos paths carregados pelo <b>load_model_paths</b> esse método
		# irá scannear os modelos e separar os relacionamentos existentes.
		#
		def map_constraint_needs
			# Hash que irá armazenas os relacionamentos pelo path do modelo.
			@needs = {}
			
			# Iterando os paths carregados
			@model_paths.each do |path|
				
				maps = []
				File.open(path, "r").each do |line|

					# Identifica os tokens
					@@tokens.each do |token|						
						if Regexp.new("#{token}").match(line)
							# Caso obedeça a expressão regular armazena
							maps << line
						end
					end
					
				end
				# Armazena os paths sob o path do modelo
				@needs[path] = maps
				
			end
		end
		
		# Carrega os paths reais dos modelos, faz a leitura apenas de arquivos
		# com a terminação .rb
		#
		def load_model_paths
			@model_paths = []
			
			# Carregando path dos arquivos .rb
			Dir.entries(@path).each do |file_name|
				if file_name =~ /.*\.rb$/
					@model_paths << @path + file_name
				end
			end
			
		end
	end

	private
	
	# Executa o sql passado
	#
	def self.apply(sql)
		begin
			con = ActiveRecord::Base.connection()
			con.begin_db_transaction
			con.execute(sql)
			con.commit_db_transaction
			
			puts "-> Constraints aplicadas com sucesso!"
		rescue StandardError => e
			puts "-> Falha ao aplicar constraints. (#{e})"
		end
	end
	
	# Gera um arquivo com o nome e o conteúdo informado
	#
	def self.generate_file(name, array_with_content)
		
		string = ""
		# Gerando arquivo
		File.open(name, "w") do |file|
		
			# Adicionando conteudo
			array_with_content.each do |content|
				file.puts content
				string << content
			end
			
		end
		
		string
	end

end






























