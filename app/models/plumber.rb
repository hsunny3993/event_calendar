class Plumber < ApplicationRecord
  belongs_to :address
  has_many :job_relations

  delegate :inline_address, to: :address, prefix: false

  validates :name, presence: true
  validates :vehicle, presence: true
end
