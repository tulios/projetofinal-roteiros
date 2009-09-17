namespace :db do
	
	namespace :constraints do

		desc "Cria constraints de banco para os modelos criados"
	  task :generate => :environment do
			require 'db/scripts/constraints'
			Constraints.generate
	  end

	end

end
