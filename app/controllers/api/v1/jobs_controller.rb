module Api
  module V1
    class JobsController < ApplicationController
      before_action :set_job, only: [:mark_job_as_completed]

      def mark_job_as_completed
        @job.is_completed = true
        @job.save!
      end

      private
      def set_job
        @job = Job.find(params[:id])
      end
    end
  end
end
