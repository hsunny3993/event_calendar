class DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @jobs = Job.all
  end
end
