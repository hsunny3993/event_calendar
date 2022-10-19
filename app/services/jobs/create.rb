module Jobs
  class Create
    prepend SimpleCommand

    def initialize(options={})
      @options = {
        name:           nil,
        client_id:      nil,
        start_time:     nil,
        end_time:       nil,
        plumbers:       nil
      }.with_indifferent_access.merge(options)
    end

    def call
      ActiveRecord::Base.transaction do
        if !@options[:plumbers].present? || @options[:plumbers].empty?
          errors.add(:base, "Should be selected one plumber at least")
        else
          job = Job.create!(
            name: @options[:name],
            client_id: @options[:client_id],
            start_time: @options[:start_time],
            end_time: @options[:end_time],
          )

          if job.valid?
            @options[:plumbers].each do |plumber_id|
              JobRelation.create!(job_id: job.id, plumber_id: plumber_id)
            end
          end
        end
      end
    rescue Exception => e
      errors.add(:base, e.message)
    end
  end
end