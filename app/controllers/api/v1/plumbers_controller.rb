module Api
  module V1
    class PlumbersController < ApplicationController
      before_action :set_plumber, only: [:jobs_by_plumber_and_period]

      def jobs_by_plumber_and_period
        if @plumber && params[:start_time].present?
          @jobs = @jobs.with_end_time(params[:end_time]) if params[:end_time].present?

          @jobs = Job.includes(:job_relations)
                     .with_start_time(params[:start_time])
                     .where('job_relations.plumber_id = ?', @plumber.id)
                     .references(:job_relations)
          render json: @jobs.to_json(:include => [:job_relations]), status: :ok
        else
          render status: :bad_request
        end
      end

      private
      def set_plumber
        @plumber = Plumber.find(params[:id])
      end
    end
  end
end
