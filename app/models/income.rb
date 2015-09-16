class Income < ActiveRecord::Base
	belongs_to :mybudget
	
	def total_income
		wages.to_d + other_income.to_d
	end
end	