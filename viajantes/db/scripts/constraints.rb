module Constraints

	def self.generate
		loader = ModelLoader.new
	end
	
	class ModelLoader
		
		@@tokens = ["belongs_to"]
		attr_reader :model_paths, :needs
		
		def initialize(model_dir_path = 'app/models/')
			
			@path = model_dir_path
			
			load_model_paths
			map_constraint_needs
			generate_constraints
			
		end
		
		private
		def generate_constraints
			@needs.keys.each do |key|
				array = @needs[key]
				
				model_name = 	key.gsub(@path, '').gsub("\.rb", '')
				table_name = model_name.pluralize
				
				constraints = []
				array.each do |value|
					new_value = value
					new_association_table = false
					
					if Regexp.new("has_and_belongs_to_many").match(new_value)
						new_value = new_value.gsub("has_and_belongs_to_many", '')
						new_association_table = true
					else
						@@tokens.each do |token|
							new_value = new_value.gsub(token, '')
						end
					end
					
					foreign_table = new_value.split(',')[0].gsub(':', '').strip.lstrip.rstrip
					foreign_table_name = foreign_table.pluralize
					
					table_used_name = table_name
					if new_association_table
					  # Em caso de has_and_belongs uma tabela associativa eh criada
						table_used_name = "#{foreign_table_name}_#{table_name}"
						# Caso seja has_and_belongs a coluna fica no singular
						foreign_table = foreign_table.singularize
					end
					
					constraints << "ALTER TABLE ONLY #{table_used_name}
    ADD CONSTRAINT fk_#{table_used_name}_#{foreign_table_name} FOREIGN KEY (#{foreign_table}_id) REFERENCES #{foreign_table_name}(id);\n"
    
    			# Em caso de associativa deve-se criar constraints para os 2 lados
    			if new_association_table
    			
    				constraints << "ALTER TABLE ONLY #{table_used_name}
    ADD CONSTRAINT fk_#{table_used_name}_#{table_name} FOREIGN KEY (#{table_name.singularize}_id) REFERENCES #{table_name}(id);\n"
    			
    			end
						
				end
				
				puts constraints
			end
			
		end
		
		def map_constraint_needs
			@needs = {}
			# Iterando path dos modelos
			@model_paths.each do |path|
				
				maps = []
				File.open(path, "r").each do |line|

					# Identifica os tokens
					@@tokens.each do |token|						
						if Regexp.new("#{token}").match(line)
							maps << line
						end
					end
					
				end
				@needs[path] = maps
				
			end
		end
		
		# Carrega os paths reais dos modelos
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

end
