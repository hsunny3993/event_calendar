class JobsController < ApplicationController
  before_action :authenticate_admin!

  def index
    redirect_to root_path
  end

  def new
    @job = Job.new
    @clients = Client.all
    @plumbers = Plumber.all
    @errors = {}
  end

  def create
    command = Jobs::Create.new(create_job_params)
    command.call

    if command.success?
      flash[:notice] = "Job was saved successfully"
      redirect_to root_path
    else
      @job = Job.new
      @clients = Client.all
      @plumbers = Plumber.all
      @errors = command.errors

      render 'new'
    end
  end

  private
  def create_job_params
    {
      name:           params[:job][:name],
      client_id:      params[:job][:client_id],
      start_time:     params[:job][:start_time],
      end_time:       params[:job][:end_time],
      plumbers:       params[:job][:job_relations]
    }
  end
end
