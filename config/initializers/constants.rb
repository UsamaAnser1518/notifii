# frozen_string_literal: true

TWILIO_ACCOUNT_SID = Rails.application.credentials.dig(:twilio, :twilio_account_sid)
TWILIO_AUTH_TOKEN = Rails.application.credentials.dig(:twilio, :twilio_auth_token)
TWILIO_FROM_NUMBER = Rails.application.credentials.dig(:twilio, :twilio_from_number)
TWILIO_TEST_PHONE = Rails.application.credentials.dig(:twilio, :twilio_test_phone)
