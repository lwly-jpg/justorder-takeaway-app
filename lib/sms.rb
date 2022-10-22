require 'twilio-ruby'
require_relative 'customer'
require 'dotenv'
Dotenv.load('twilio.env')

class SMS

  def initialize(requester, customer)
    @requester = requester
    @customer = customer
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_ACCOUNT_AUTH_TOKEN'])
  end

  def send_sms
    @client.messages.create(
    from: ENV['TWILIO_TEST_MOBILE_NUMBER'], # Twilio mobile number
    to: @customer.mobile, # Customer mobile number
    body: "Hey #{@customer.name}, your order will be delivered at #{calculate_delivery_time(Time.now)}"
    )
  end

  def calculate_delivery_time(current_time)
    return delivery_time = current_time + 15*60
  end

end

### RUN CODE ###
# test_customer = Customer.new('Harry', '+447777777777')
# test = SMS.new(Kernel, test_customer)
# test.send_sms