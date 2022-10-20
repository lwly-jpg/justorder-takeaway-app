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
      expect(terminal).to receive(:puts).with("Pizza : 3.0").ordered
      expect(terminal).to receive(:puts).with("Burger : 2.0").ordered
      expect(terminal).to receive(:puts).with("Salad : 2.0").ordered
      new_customer = Takeaway.new(terminal)
      new_customer.show_menu
    end


  end

end

