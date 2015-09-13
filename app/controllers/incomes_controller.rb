class IncomesController < ApplicationController
	before_action :set_income, only: [:show, :edit, :update, :destroy]

def new
	@income = Income.new
end

def edit
end

def create
	@income = Income.new(income_params)
	respond_to do |format|
    	if @income.save
	  	  format.html { redirect_to edit_income_path(@income)}
		end
	end
end

def update
	respond_to do |format|
    	if @income.update(income_params)
	  	  format.html { redirect_to edit_income_path(@income)}
		end
	end
end

  private
    def set_income
      @income = Income.find(params[:id])
  	end

  	def income_params
      params.require(:income).permit(:wages, :other_income)
    end

end
