class ApplicationMailer < ActionMailer::Base
  default from: 'bot@twitter-digest.herokuapp.com'
  layout 'mailer'
end
