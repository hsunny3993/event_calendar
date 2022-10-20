Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new


Rack::Attack.throttle("requests by ip", limit: 5, period: 10.seconds) do |request|
  request.ip
end
