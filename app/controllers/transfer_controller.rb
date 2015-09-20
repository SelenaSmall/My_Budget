class TransferController < ApplicationController
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
			end
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