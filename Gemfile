source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'turbolinks', '~> 5'
gem 'slim-rails'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'pry-rails'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'clearance'
gem 'figaro'
gem 'twitter'
gem 'attr_encrypted'
gem 'timber'
gem 'timber-rails', github: 'timberio/timber-ruby-rails', branch: 'master'
gem "sentry-raven"
gem "inline_svg"
gem "sucker_punch"
gem "hashid-rails"
gem "view_component"
gem "premailer-rails"

gem "sprockets-rails"
gem "jsbundling-rails"
gem "cssbundling-rails"


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

gem "geared_pagination", "~> 1.0"

gem "omniauth-rails_csrf_protection", "~> 1.0"

gem "clockwork", "~> 3.0"
gem 'net-smtp', require: false
gem 'net-pop', require: false
gem 'net-imap', require: false

gem "digest", "~> 3.1"
