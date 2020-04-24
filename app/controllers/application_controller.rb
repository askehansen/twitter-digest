class ApplicationController < ActionController::Base
  include Clearance::Controller
  NotAuthorized = Class.new(StandardError)
end
