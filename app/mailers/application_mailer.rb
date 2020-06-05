# frozen_string_literal: true

# mailer class
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@training.wolox.com.ar'
  layout 'mailer'
end
