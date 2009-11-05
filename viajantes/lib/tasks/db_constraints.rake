namespace :db do
	
	namespace :constraints do

		desc "Gera um arquivo com as constraints de banco para os relacionamentos dos modelos"
	  task :generate => :environment do
			require 'db/scripts/constraints'
			Constraints.generate
	  end

		desc "Gera constraints de banco baseadas nos relacionamentos dos modelos e aplica ao banco configurado"
		task :load => :environment do
			require 'db/scripts/constraints'
			Constraints.load
		end
	end

end
