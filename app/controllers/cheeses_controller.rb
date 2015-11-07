class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show, :update, :edit, :destroy]
  def index
    @title = "Cheese Database"
    @cheeses = Cheese.all
  end

  def new
    @title = "Add Cheese"
    @cheese = Cheese.new
  end
  
  def create
    @title = "Add Cheese"
    @cheese = Cheese.new(cheese_params)

    if @cheese.save
      flash[:notice] = "Cheese has been added!"
      redirect_to @cheese
    else
      flash.now[:error] = "Cheese has not been added!"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @cheese.update(cheese_params)
      flash[:notice] = "Cheese has been updated"
      redirect_to @cheese
    else
      flash.now[:alert] = "Cheese has not been updated"
      render "edit"
    end
  end

  def destroy
    @cheese.destroy

    flash[:notice] = "Cheese has been deleted."
    redirect_to cheeses_path
  end

  private

  def set_cheese
    @cheese = Cheese.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The cheese you were looking for could not be found."
    redirect_to cheeses_path
  end

  def cheese_params
    params.require(:cheese).permit(:name, :milk, :description, :country, :region, 
                                   :producer, :rind, :rennet, :texture, :age)
  end

end
