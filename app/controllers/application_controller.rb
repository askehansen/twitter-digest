class ApplicationController < ActionController::Base
  before_action :set_raven_context
  include Clearance::Controller


  private

  def set_raven_context
   Raven.user_context(id: current_user&.id, email: current_user&.email)
   Raven.extra_context()
  end
end
