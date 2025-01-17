# frozen_string_literal: true

module Twilio
  # Service to send notification message to phone
  class SmsService
    def initialize(message:, to_phone:)
      @message = message
      @to_phone = to_phone
      @account_sid = TWILIO_ACCOUNT_SID
      @auth_token = TWILIO_AUTH_TOKEN
      @from_number = TWILIO_FROM_NUMBER
      @test_number = TWILIO_TEST_PHONE
    end

    def call
      @client = Twilio::REST::Client.new(@account_sid, @auth_token)
      message = @client.messages
                       .create(
                         from: @from_number,
                         to: to(@to_phone),
                         body: @message
                       )
    end

    private

    def to(to_phone)
      return @test_number if Rails.env.development?

      to_phone
    end
  end
end
