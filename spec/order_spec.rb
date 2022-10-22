require 'order'

describe Order do
  context 'when new customer is added' do
    it 'returns customer details' do
      new_customer = double(:new_customer, name: "Potter", mobile: "07890987651")
      new_order = Order.new(new_customer)
      expect(new_order.show_customer).to eq "Name: Potter, Mobile: 07890987651"
    end
  end

  context 'when new basket is added' do
    it 'returns basket details' do
      new_basket = double(:new_basket)
      allow(new_basket).to receive(:show_basket).and_return("Pizza : £3.00, Burger : £2.50. Total: £5.50")
      new_customer = double(:new_customer, name: "Potter", mobile: "07890987651")
      new_order = Order.new(new_customer)
      new_order.add_basket(new_basket)
      expect(new_order.show_order).to eq "Pizza : £3.00, Burger : £2.50. Total: £5.50"
    end
  end
end

