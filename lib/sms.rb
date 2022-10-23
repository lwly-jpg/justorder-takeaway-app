require 'twilio-ruby'
require_relative 'customer'
require 'dotenv'
Dotenv.load('twilio.env')

class SMS

  def initialize(customer)
    # Requires customer name and mobile to initialize, Twillio SID and AUTH token saved in ENV"
    @customer = customer
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_ACCOUNT_AUTH_TOKEN'])
  end

  def send_sms
    # Sends SMS using Twilio API, addressed to customer and with estimated delivery time
    @client.messages.create(
    from: ENV['TWILIO_TEST_MOBILE_NUMBER'], # Twilio mobile number, in ENV
    to: @customer.mobile, # Customer mobile number
    body: "Hey #{@customer.name}, your order was placed and will be delivered at #{calculate_delivery_time(Time.now)}"
    )
    return "Text sent successfully."
  end

  def calculate_delivery_time(current_time)
    return delivery_time = current_time + 15*60
  end

end

### RUN CODE ###
# test_customer = Customer.new('Harry', ENV['MY_NUM'])
# test = SMS.new(test_customer)
# test.send_sms