namespace :db do
	
	namespace :scripts do

		desc "Executa todos os scripts da pasta db/scripts"
	  task :load => :environment do
			require 'db/scripts/scripts'
			Scripts.load
	  end

	end

end
