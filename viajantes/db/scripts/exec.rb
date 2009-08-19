#!/usr/bin/ruby

# Nome do banco
DB_NAME = "viajantes"
SCRIPTS_DIR = "db/scripts/"

scripts = [
	"insert_paises_regioes_estados_cidades.sql",
	"insert_tags.sql",
	"insert_roles.sql",
	"insert_meios_de_transporte.sql"
]

puts "Dropando schema e recriando tabelas com rake"
system ("rake -q db:schema:load")

puts "Montando scripts para execucao"
# Montando comando a ser executado no banco
scripts.each do |script|
	
	command = "psql -q -f #{SCRIPTS_DIR}#{script} -U viajantes -d #{DB_NAME}"
	puts "Executando: #{script}"

	if system(command)
		puts "\tScript executado com sucesso"
	else
		puts "\tFalha ao executar script"
	end

end

puts "Criando usuario: quentin, senha: test"
insert = "#{SCRIPTS_DIR}quentin.sql"

if system("psql -f #{insert} -q -U viajantes -d #{DB_NAME}")
	puts "Quentin criado com sucesso!"
else
	puts "Falha ao inserir quentin"
end































