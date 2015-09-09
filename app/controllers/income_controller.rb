class IncomeController < ApplicationController
	before_action :set_income, only: [:show, :edit, :update, :destroy]

def index
end

def new
end

  private
    def set_income
      @income 
  	end

  	def income_params
      params.require(:income).permit(:wages, :other_income, :income_total)
    end

end
