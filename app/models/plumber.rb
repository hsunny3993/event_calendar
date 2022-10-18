class Plumber < ApplicationRecord
  belongs_to :address
  has_many :job_relations
end
