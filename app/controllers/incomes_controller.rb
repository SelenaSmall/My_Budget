class IncomesController < ApplicationController
	before_action :set_income, only: [:show, :edit, :update, :destroy]

def index
	@income = Income.all
end

def new
	@income = Income.new
end

def create
	@income = Income.new(income_params)
	respond_to do |format|
    	if @income.save
	  	  format.html { redirect_to incomes_path}
		end
	end
end

def update
	respond_to do |format|
    	if @income.update(income_params)
	  	  format.html { redirect_to (@incomes)}
		end
	end
end

  private
    def set_income
      @income = Income.find(params[:id])
  	end

  	def income_params
      params.require(:income).permit(:wages, :other_income, :income_total)
    end

end
