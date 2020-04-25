class ApplicationController < ActionController::Base
  before_action :set_raven_context, :set_timezone
  include Clearance::Controller


  private

  def set_timezone
    Time.zone = current_user&.timezone
  end

  def set_raven_context
   Raven.user_context(id: current_user&.id, email: current_user&.email, timezone: current_user&.timezone)
   Raven.extra_context()
  end
end
