class ApplicationMailer < ActionMailer::Base
  default from: 'notify@lostify.lostify'
  layout 'mailer'
end
