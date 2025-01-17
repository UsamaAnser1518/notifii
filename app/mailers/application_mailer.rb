# frozen_string_literal: true

# Starting point for mailer service
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
