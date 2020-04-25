if ENV["TIMBER_API_KEY"] && ENV["TIMBER_SOURCE_ID"]
    http_device = Timber::LogDevices::HTTP.new(ENV["TIMBER_API_KEY"], ENV["TIMBER_SOURCE_ID"])
    Rails.logger = Timber::Logger.new(http_device)
else
    Rails.logger = Timber::Logger.new(STDOUT)
end

Timber.config.integrations.rack.http_events.collapse_into_single_event = true


Timber.config.integrations.rack.user_context.custom_user_hash = lambda do |rack_env|
  Timber::CurrentContext.remove(:user)
  if user = rack_env[:clearance].current_user
    {
      id: user.id,
      email: user.email,
      timezone: user.timezone,
    }
  else
    nil
  end
end
