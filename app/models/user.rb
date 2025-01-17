# frozen_string_literal: true

# User model
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :phone, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must be a valid email' },
                    length: { maximum: 255 }
  validates :name, length: { minimum: 2 }
  validates :password, presence: true, length: { minimum: 6 }

  after_create :send_welcome_sms

  private

  def send_welcome_sms
    sms_service = Twilio::SmsService.new(
      message: 'Welcome to SMS Notification App!',
      to_phone: phone
    )
    sms_service.call
  end
end
