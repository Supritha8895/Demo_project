class TwilioNotificationService
  def initialize(product)
    @product = product
  end

  def send_sms(action, phone_number)
    client = Twilio::REST::Client.new(account_id, auth_token)
    to_phone_number = phone_number 
    message_body = "Action: #{action}, ID: #{@product.id}, Name: #{@product.name}, Data: #{@product.data}, Phone: #{@product.phone_number}"
    message = client.messages.create(
      body: message_body,
      from: from,
      to: "+#{to_phone_number}"
    )
    if message.sid.present?
      Rails.logger.info("Successfully notified Twilio for #{action}")
    else
      Rails.logger.error("Failed to notify Twilio for #{action}. Error: #{message.error_message}")
    end
  end

  def account_id
    ENV['TWILIO_ACCOUNT_SID'] || "AC8b36d1ec6bf9742561fa2d4d3829230e"
  end

  def auth_token
    ENV['TWILIO_AUTH_TOKEN']
  end

  def from
    ENV['TWILIO_PHONE_NUMBER']
  end
end
  