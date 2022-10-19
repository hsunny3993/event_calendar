class Client < ApplicationRecord
  belongs_to :address
  has_many :jobs

  delegate :inline_address, to: :address, prefix: false

  validates :name, presence: true
  validates :age, presence: true
end
