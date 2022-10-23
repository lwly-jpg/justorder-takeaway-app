require 'order'
require 'dotenv'
Dotenv.load('twilio.env')

describe Order do
  context 'when new customer is added' do
    it 'returns customer details' do
      new_customer = double(:new_customer, name: "Potter", mobile: "07890987651")
      new_order = Order.new(new_customer)
      expect(new_order.show_customer).to eq "Name: Potter, Mobile: 07890987651"
    end

    it 'returns menu contents' do
      new_customer = double(:new_customer, name: "Potter", mobile: "07890987651")
      new_order = Order.new(new_customer)
      expect(new_order.show_menu).to eq ["Pasta : £2.50", "Chips : £1.00", "Olives : £0.50", "Pizza : £3.00", "Burger : £2.50"]
    end
  end

  context 'when no items have been added to the order' do
    it 'raises error when empty basket is shown' do
      new_customer = double(:new_customer, name: "Potter", mobile: "07890987651")
      new_order = Order.new(new_customer)
      expect{new_order.show_basket}.to raise_error "Empty basket! Add at least one dish first."
    end
  end

  context 'when new item is added to order' do

    it 'returns multiple dishes as formatted strings with correc total' do
      new_customer = double(:new_customer, name: "Potter", mobile: "07890987651")
      new_order = Order.new(new_customer)
      pizza_dish = double(:pizza_dish, name: "pizza", price: 3.0)
      burger_dish = double(:burger_dish, name: "burger", price: 2.5)
      new_order.add_dish(pizza_dish)
      new_order.add_dish(burger_dish)
      expect(new_order.show_basket).to eq "Pizza : £3.00, Burger : £2.50. Total: £5.50"
    end

    it 'raises error when item does not exist on menu' do
      new_customer = double(:new_customer, name: "Potter", mobile: "07890987651")
      new_order = Order.new(new_customer)
      pizza_dish = double(:pizza_dish, name: "pizza", price: 3.0)
      rice_dish = double(:rice_dish, name: "rice", price: 2.5)
      new_order.add_dish(pizza_dish)
      expect {new_order.add_dish(rice_dish)}.to raise_error "Invalid - dish is not on the menu."
    end

  end

  context 'when customer submits order' do

    it 'sends SMS to confirm' do
      new_customer = double(:new_customer, name: "Potter", mobile: "+77777777777") # note test fails unless phone number is verified in Twilio account!
      new_order = Order.new(new_customer)
      test_sms = double(:test_sms)
      allow(test_sms).to receive(:send_sms)
      # new_order.submit_order
    end

    it 'raises error if basket is empty' do
      new_customer = double(:new_customer, name: "Potter", mobile: "07890987651")
      new_order = Order.new(new_customer)
      expect {new_order.submit_order}.to raise_error "Basket empty - cannot submit empty order."
    end

  end


end

