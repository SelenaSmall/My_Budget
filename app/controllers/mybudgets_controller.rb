class MybudgetsController < ApplicationController
	before_action :set_mybudget, only: [:show, :edit, :update, :destroy]
  
  def index
    @mybudget = Mybudget.all
  end

  def new
    @mybudget = Mybudget.new
  end

  def show
  end

  def edit
  end

  def create
    @mybudget = Mybudget.new(mybudget_params)

   respond_to do |format|
      if @mybudget.save
        format.html { redirect_to mybudget_path(@mybudget), notice: 'mybudget was successfully created.' }
        format.json { render :show, status: :created, location: @mybudget }
      else
        format.html { render :new }
        format.json { render json: @mybudget.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mybudget.update(mybudget_params)
        format.html { redirect_to edit_mybudget_path(@mybudget)}
        format.json { render :show, status: :ok, location: @mybudget }
        format.js {redirect_via_turbolinks_to [mybudget]}
      else
        format.html { render :edit }
        format.json { render json: @mybudget.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mybudget.destroy
    respond_to do |format|
      format.html { redirect_to new_mybudgets_path(@mybudget), notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 private
  def set_mybudget
    @mybudget = Mybudget.find(params[:id])
  end

  def mybudget_params
    params.require(:mybudget).permit(:name, :open_bal)
  end
end