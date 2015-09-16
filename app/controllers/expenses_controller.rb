class ExpensesController < ApplicationController
	before_action :set_expense, only: [:show, :edit, :update, :destroy]

#def new
#	@expense = Expense.new
#end

def edit
end

def create
	@expense = Expense.new(expense_params)
	respond_to do |format|
    	if @expense.save
	  	  format.html { redirect_to edit_expense_path(@expense)}
		end
	end
end

def update
	respond_to do |format|
    	if @expense.update(expense_params)
	  	  format.html { redirect_to edit_expense_path(@expense)}
		end
	end
end

  private
    def set_expense
      @expense = Expense.find(params[:id])
  	end

  	def expense_params
      params.require(:expense).permit(:outgoing, :oneoff)
    end
end