require 'rails_helper'
require 'twilio-ruby'

RSpec.describe Twilio::SmsService do
  let(:message) { 'Test message' }
  let(:to_phone) { '11111111111' }
  let(:from_number) { '11111111111' } # Assuming this is set in your Rails credentials
  let(:test_number) { '00000000000' } # Assuming this is set in your Rails credentials
  let(:account_sid) { 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' }
  let(:auth_token) { 'your_auth_token' }

  before do
    allow(Rails.application.credentials).to receive(:twilio).and_return({
      account_sid: account_sid,
      auth_token: auth_token,
      from_number: from_number,
      test_phone: test_number
    })
  end

  describe '#call' do
    let(:client) { instance_double(Twilio::REST::Client) }
    let(:messages) { instance_double(Twilio::REST::Api::V2010::AccountContext::MessageList) }
    let(:service) { described_class.new(message: message, to_phone: to_phone) }

    before do
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      allow(client).to receive(:messages).and_return(messages)
      allow(messages).to receive(:create)
    end

    it 'sends a message to the specified phone number in production' do
      allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new("production"))

      service.call

      expect(messages).to have_received(:create).with(
        from: from_number,
        to: to_phone,
        body: message
      )
    end

    it 'sends a message to the test phone number in development' do
      allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new("development"))

      service.call

      expect(messages).to have_received(:create).with(
        from: from_number,
        to: test_number,
        body: message
      )
    end
  end
end
