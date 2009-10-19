namespace :db do
	
	namespace :scripts do

		desc "Executa todos os scripts da pasta db/scripts"
	  task :load => :environment do
			require 'db/scripts/scripts'
			Scripts.load
	  end
          
    desc "Carrega o ultimo dump do banco de dados presente na pasta db/dump"
    task :load_dump => :environment do
      require 'db/scripts/scripts'
			Scripts.load_dump
    end

	end

end
