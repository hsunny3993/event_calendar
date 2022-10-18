class JobRelation < ApplicationRecord
  belongs_to :job
  belongs_to :plumber
end
