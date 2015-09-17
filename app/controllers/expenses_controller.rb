class ExpensesController < ApplicationController
	before_action :set_mybudget
	before_action :set_expense, only: [:show, :edit, :update, :destroy]

def index
  @expenses = @mybudget.expenses.all
end

def new
	@expense = @mybudget.expenses.build
end

def create
	@expense = @mybudget.expenses.build(expense_params)

	respond_to do |format|
    if @expense.save
        format.html { redirect_to [@mybudget, @expenses], notice: 'expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
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
  	def set_mybudget
      @mybudget = Mybudget.find(params[:mybudget_id])
    end

    def set_expense
      @expense = Expense.find(params[:id])
  	end

  	def expense_params
      params.require(:expense).permit(:expense, :amount)
    end
end