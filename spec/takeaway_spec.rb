require 'takeaway'

describe Takeaway do
  context 'when initialized' do
    it 'greets user and shows list of options' do
      terminal = double :terminal
      expect(terminal).to receive(:puts).with("Hello, welcome to JustOrder. How can I help you today?")
      expect(terminal).to receive(:puts).with("1. Show menu")
      expect(terminal).to receive(:puts).with("2. New order")
      new_customer = Takeaway.new(terminal)
      new_customer.takeaway_options
    end

    it 'shows menu' do
      terminal = double :terminal
      expect(terminal).to receive(:puts).with("Pizza : £3.00").ordered
      expect(terminal).to receive(:puts).with("Burger : £2.00").ordered
      expect(terminal).to receive(:puts).with("Salad : £2.00").ordered
      new_customer = Takeaway.new(terminal)
      new_customer.show_menu
    end

    it 'returns user order input' do
      terminal = double :terminal
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:")
      expect(terminal).to receive(:gets).and_return("burger")
      expect(terminal).to receive(:puts).with("1 x Burger added to your order")
      new_customer = Takeaway.new(terminal)
      new_customer.add_item
    end

    it 'adds one item to order list' do
      terminal = double :terminal
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:")
      expect(terminal).to receive(:gets).and_return("burger")
      expect(terminal).to receive(:puts).with("1 x Burger added to your order")
      new_customer = Takeaway.new(terminal)
      new_customer.add_item
      expect(new_customer.show_order).to eq("burger" => 2.0)
    end

    it 'adds multiple items to order list' do
      terminal = double :terminal
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:")
      expect(terminal).to receive(:gets).and_return("burger")
      expect(terminal).to receive(:puts).with("1 x Burger added to your order")
      new_customer = Takeaway.new(terminal)
      new_customer.add_item
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:")
      expect(terminal).to receive(:gets).and_return("pizza")
      expect(terminal).to receive(:puts).with("1 x Pizza added to your order")
      new_customer.add_item
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:")
      expect(terminal).to receive(:gets).and_return("salad")
      expect(terminal).to receive(:puts).with("1 x Salad added to your order")
      new_customer.add_item
      expect(new_customer.show_order).to eq("burger" => 2.0, "pizza" => 3.0, "salad" => 2.0)
    end


  end

end

