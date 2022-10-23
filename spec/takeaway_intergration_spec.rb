require 'customer'
require 'dish'
require 'order'
require 'sms'
require 'dotenv'
Dotenv.load('twilio.env')

describe 'integration tests' do
  context 'when new customer is added' do
    it 'returns menu contents' do
      new_customer = Customer.new("Potter", "07890987651")
      new_order = Order.new(new_customer)
      expect(new_order.show_menu).to eq ["Pasta : £2.50", "Chips : £1.00", "Olives : £0.50", "Pizza : £3.00", "Burger : £2.50"]
    end
  end

  context 'when no items have been added to the order' do
    it 'raises error when empty basket is shown' do
      new_customer = Customer.new("Potter", "07890987651")
      new_order = Order.new(new_customer)
      expect{new_order.show_basket}.to raise_error "Empty basket! Add at least one dish first."
    end
  end

  context 'when new item is added to order' do

    it 'returns multiple dishes as formatted strings with correct total' do
      new_customer = Customer.new("Potter", "07890987651")
      new_order = Order.new(new_customer)
      pizza_dish = Dish.new("pizza", 3.0)
      burger_dish = Dish.new("burger", 2.5)
      new_order.add_dish(pizza_dish)
      new_order.add_dish(burger_dish)
      expect(new_order.show_basket).to eq "Pizza : £3.00, Burger : £2.50. Total: £5.50"
    end

    it 'raises error when item does not exist on menu' do
      new_customer = Customer.new("Potter", "07890987651")
      new_order = Order.new(new_customer)
      pizza_dish = Dish.new("pizza", 3.0)
      rice_dish = Dish.new("rice", 2.5)
      new_order.add_dish(pizza_dish)
      expect {new_order.add_dish(rice_dish)}.to raise_error "Invalid - dish is not on the menu."
    end

  end

  context 'when customer submits order' do

    it 'sends SMS to confirm' do
      new_customer = Customer.new("Potter", ENV['MY_NUM']) # note test FAILS unless phone number is verified in Twilio account!
      new_order = Order.new(new_customer)
      pizza_dish = Dish.new("pizza", 3.0)
      new_order.add_dish(pizza_dish)
      test_sms = SMS.new(new_customer)
      expect(new_order.submit_order).to eq "Thanks for your order, Potter. You will receive a confirmation text to your number: #{ENV['MY_NUM']}."
    end

    it 'raises error if basket is empty' do
      new_customer = double(:new_customer, name: "Potter", mobile: ENV['MY_NUM'])
      new_order = Order.new(new_customer)
      expect {new_order.submit_order}.to raise_error "Basket empty - cannot submit empty order."
    end

  end
end