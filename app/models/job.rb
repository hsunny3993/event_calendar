class Job < ApplicationRecord
  has_many :job_relations
  belongs_to :client

  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  scope :with_start_time, lambda { |start_time| where('start_time >= ?', start_time) if start_time.present? }
  scope :with_end_time, lambda { |end_time| where('end_time < ?', end_time) if end_time.present? }
end
