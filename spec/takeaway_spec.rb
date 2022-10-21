require 'takeaway'

describe Takeaway do
  context 'when initialized' do
    it 'greets user and shows list of options' do
      terminal = double :terminal
      expect(terminal).to receive(:puts).with("Hello, welcome to JustOrder. How can I help you today?").ordered
      expect(terminal).to receive(:puts).with("1. Show menu").ordered
      expect(terminal).to receive(:puts).with("2. New order").ordered
      expect(terminal).to receive(:puts).with("3. Show current order").ordered
      expect(terminal).to receive(:puts).with("5. Exit").ordered
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

    it 'loads menu when requested by user' do
      terminal = double :terminal
      expect(terminal).to receive(:puts).with("Hello, welcome to JustOrder. How can I help you today?").ordered
      expect(terminal).to receive(:puts).with("1. Show menu").ordered
      expect(terminal).to receive(:puts).with("2. New order").ordered
      expect(terminal).to receive(:puts).with("3. Show current order").ordered
      expect(terminal).to receive(:puts).with("5. Exit").ordered
      new_customer = Takeaway.new(terminal)
      new_customer.takeaway_options
      expect(terminal).to receive(:puts).with("Pizza : £3.00").ordered
      expect(terminal).to receive(:puts).with("Burger : £2.00").ordered
      expect(terminal).to receive(:puts).with("Salad : £2.00").ordered
      new_customer.process_input("1")
    end


    # it 'returns user order input' do
    #   terminal = double :terminal
    #   expect(terminal).to receive(:puts).with("Input what item you'd like to order:")
    #   expect(terminal).to receive(:gets).and_return("burger")
    #   expect(terminal).to receive(:puts).with("1 x Burger added to your order. Anything else (Y/N)?")
    #   new_customer = Takeaway.new(terminal)
    #   new_customer.add_item
    # end

    it 'adds one item to order list' do
      terminal = double :terminal
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:")
      expect(terminal).to receive(:gets).and_return("burger")
      expect(terminal).to receive(:puts).with("1 x Burger added to your order. Anything else (Y/N)?")
      expect(terminal).to receive(:gets).and_return("N")
      new_customer = Takeaway.new(terminal)
      new_customer.add_item
      expect(terminal).to receive(:puts).with("Burger : £2.00").ordered
      new_customer.show_order
    end

    it 'adds multiple items to order list' do
      terminal = double :terminal
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:")
      expect(terminal).to receive(:gets).and_return("burger")
      expect(terminal).to receive(:puts).with("1 x Burger added to your order. Anything else (Y/N)?")
      expect(terminal).to receive(:gets).and_return("Y")
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:")
      expect(terminal).to receive(:gets).and_return("pizza")
      expect(terminal).to receive(:puts).with("1 x Pizza added to your order. Anything else (Y/N)?")
      expect(terminal).to receive(:gets).and_return("Y")
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:")
      expect(terminal).to receive(:gets).and_return("salad")
      expect(terminal).to receive(:puts).with("1 x Salad added to your order. Anything else (Y/N)?")
      expect(terminal).to receive(:gets).and_return("N")
      new_customer = Takeaway.new(terminal)
      new_customer.add_item
      expect(terminal).to receive(:puts).with("Burger : £2.00").ordered
      expect(terminal).to receive(:puts).with("Pizza : £3.00").ordered
      expect(terminal).to receive(:puts).with("Salad : £2.00").ordered
      new_customer.show_order
    end

    it 'adds multiple items to order list' do
      terminal = double :terminal
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:")
      expect(terminal).to receive(:gets).and_return("burger")
      expect(terminal).to receive(:puts).with("1 x Burger added to your order. Anything else (Y/N)?")
      expect(terminal).to receive(:gets).and_return("Y")
      new_customer = Takeaway.new(terminal)
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:")
      expect(terminal).to receive(:gets).and_return("pizza")
      expect(terminal).to receive(:puts).with("1 x Pizza added to your order. Anything else (Y/N)?")
      expect(terminal).to receive(:gets).and_return("Y")
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:")
      expect(terminal).to receive(:gets).and_return("salad")
      expect(terminal).to receive(:puts).with("1 x Salad added to your order. Anything else (Y/N)?")
      expect(terminal).to receive(:gets).and_return("N")
      new_customer.add_item
      expect(terminal).to receive(:puts).with("Burger : £2.00").ordered
      expect(terminal).to receive(:puts).with("Pizza : £3.00").ordered
      expect(terminal).to receive(:puts).with("Salad : £2.00").ordered
      new_customer.show_order
    end

    it 'loads current order when requested by user' do
      terminal = double :terminal
      expect(terminal).to receive(:puts).with("Hello, welcome to JustOrder. How can I help you today?").ordered
      expect(terminal).to receive(:puts).with("1. Show menu").ordered
      expect(terminal).to receive(:puts).with("2. New order").ordered
      expect(terminal).to receive(:puts).with("3. Show current order").ordered
      expect(terminal).to receive(:puts).with("5. Exit").ordered
      new_customer = Takeaway.new(terminal)
      new_customer.takeaway_options
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:").ordered
      expect(terminal).to receive(:gets).and_return("burger").ordered
      expect(terminal).to receive(:puts).with("1 x Burger added to your order. Anything else (Y/N)?").ordered
      expect(terminal).to receive(:gets).and_return("Y")
      expect(terminal).to receive(:puts).with("Input what item you'd like to order:").ordered
      expect(terminal).to receive(:gets).and_return("pizza").ordered
      expect(terminal).to receive(:puts).with("1 x Pizza added to your order. Anything else (Y/N)?").ordered
      expect(terminal).to receive(:gets).and_return("N")
      new_customer.process_input("2")
      expect(terminal).to receive(:puts).with("Burger : £2.00").ordered
      expect(terminal).to receive(:puts).with("Pizza : £3.00").ordered
      new_customer.process_input("3")
    end

    it 'exits and closes program when selected' do
      terminal = double :terminal
      expect(terminal).to receive(:puts).with("Hello, welcome to JustOrder. How can I help you today?").ordered
      expect(terminal).to receive(:puts).with("1. Show menu").ordered
      expect(terminal).to receive(:puts).with("2. New order").ordered
      expect(terminal).to receive(:puts).with("3. Show current order").ordered
      expect(terminal).to receive(:puts).with("5. Exit").ordered
      new_customer = Takeaway.new(terminal)
      new_customer.takeaway_options
      result = new_customer.process_input("5")
      expect{result}.to raise_exception(SystemExit)
    end

  end

end

