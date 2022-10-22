require 'sms'
require 'dotenv'
Dotenv.load('twilio.env')

describe 'SMS' do
  it 'sends confirmation message' do
    test_customer = double(:test_customer, name: "Harry", mobile: "+447777777777")
    test_sms = SMS.new(test_customer)
    expect(test_sms).to receive(:send_sms)
    test_sms.send_sms
  end

  it 'calculates delivery time' do
    test_customer = double(:new_customer, name: "Potter", mobile: "+447777777777")
    test_sms = SMS.new(test_customer)
    pretend_time = Time.new(2022, 10, 22, 11, 00, 03)
    result = test_sms.calculate_delivery_time(pretend_time)
    expect(result).to eq (Time.new(2022, 10, 22, 11, 15, 03))
  end
end

