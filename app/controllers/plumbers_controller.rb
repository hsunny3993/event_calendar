class PlumbersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @plumbers = Plumber.all
  end

  def new
    @plumber = Plumber.new
    @addresses = Address.all
  end

  def create
    @plumber = Plumber.new(create_plumber_params)
    if @plumber.save
      flash[:notice] = "Plumber was saved successfully"
      redirect_to plumbers_path
    else
      @addresses = Address.all
      render 'new'
    end
  end

  private
  def create_plumber_params
    {
      name:       params[:plumber][:name],
      vehicle:    params[:plumber][:vehicle],
      address_id: params[:plumber][:address_id]
    }
  end
end
