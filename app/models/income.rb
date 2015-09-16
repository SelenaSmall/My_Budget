class Income < ActiveRecord::Base
	def total_income
		wages.to_d + other_income.to_d
	end
end	