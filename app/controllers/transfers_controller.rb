class TransfersController < ApplicationController
	before_action :set_mybudget
	before_action :set_transfer, only: [:show, :edit, :update, :destroy]

	def index
  	@transfers = @mybudget.transfers.all
	end

	def new
		@transfer = @mybudget.transfers.build
	end

	def edit
	end

	def create
	 @transfer = @mybudget.transfers.build(transfer_params)

		respond_to do |format|
    	if @transfer.save
        format.html { redirect_to [@mybudget, @transfers], notice: 'transfer was successfully created.' }
        format.json { render :show, status: :created, location: @transfer }
        format.js {redirect_via_turbolinks_to [@mybudget, @transfers]}
      	else
        format.html { render :new }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
		respond_to do |format|
    	if @transfer.update(transfer_params)
	  	  format.html { redirect_to edit_transfer_path(@transfer)}
			   format.json { render :show, status: :ok, location: @transfer }
        format.js {redirect_via_turbolinks_to [@mybudget, @transfers]}
      else
        format.html { render :edit }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transfer.destroy
    respond_to do |format|
      format.html { redirect_to mybudget_trasfers_path(@mybudget), notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_mybudget
      @mybudget = Mybudget.find(params[:mybudget_id])
    end

    def set_transfer
      @transfer = Transfer.find(params[:id])
  	end

  	def transfer_params
      params.require(:transfer).permit(:transfer, :amount)
    end
end