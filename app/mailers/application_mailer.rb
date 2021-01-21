class ApplicationMailer < ActionMailer::Base
  default from: 'bot@twitter-digest.deeco.dk'
  layout 'mailer'
end
