class ApplicationController < ActionController::Base
  # In generally, put request requires authentication to prevent CSRF attack
  # But, this test api doesn't require auth. so we need to disable this feature
  protect_from_forgery with: :null_session
end
