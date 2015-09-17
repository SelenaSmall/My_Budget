class Mybudget < ActiveRecord::Base
	has_many :incomes
	has_many :expenses
end