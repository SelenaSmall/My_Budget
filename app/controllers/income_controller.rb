class IncomeController < ApplicationController
	before_action :set_income

def index
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income
      @income 
  	end

  	def income_params
      params.require(:income).permit(:wages, :other_income, :income_total)
    end

end
