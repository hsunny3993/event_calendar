class Job < ApplicationRecord
  has_many :job_relations
  belongs_to :client
end
