class Client < ApplicationRecord
  belongs_to :address
  has_many :jobs
end
