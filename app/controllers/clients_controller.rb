class ClientsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
    @addresses = Address.all
  end

  def create
    @client = Client.new(create_client_params)
    if @client.save
      flash[:notice] = "Client was saved successfully"
      redirect_to clients_path
    else
      @addresses = Address.all
      render 'new'
    end
  end

  private
  def create_client_params
    {
      name:         params[:client][:name],
      age:          params[:client][:age],
      address_id:   params[:client][:address_id],
      private_note: params[:client][:private_note]
    }
  end
end
