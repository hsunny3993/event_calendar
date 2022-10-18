class Address < ApplicationRecord
  has_one :client
  has_one :plumber
end
