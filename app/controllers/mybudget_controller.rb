class MybudgetController < ApplicationController

  def home
  	@income = Income.new
  	@expense = Expense.new
  end
end