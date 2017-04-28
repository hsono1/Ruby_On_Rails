class Dojo < ActiveRecord::Base
	has_many :ninjas, dependent: :destroy

	def addNinja ninja
		ninja.dojo = self		
	end
end
