class Mybudget < ActiveRecord::Base
	has_many :incomes
	has_many :expenses
	has_many :transfers
end