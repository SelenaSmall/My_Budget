class Expense < ActiveRecord::Base
	def total_expense
		outgoing.to_d + oneoff.to_d
	end
end