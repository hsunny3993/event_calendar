class Address < ApplicationRecord
  has_one :client
  has_one :plumber

  def inline_address
    "#{street}, #{city}, #{country}"
  end
end
