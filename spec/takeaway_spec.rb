require 'takeaway'

describe Takeaway do
  context 'when initialized' do
    it 'greets user and shows list of options' do
      terminal = double :terminal
      expect(terminal).to receive(:puts).with("Hello, welcome to JustOrder. How can I help you today?")
      expect(terminal).to receive(:puts).with("1. Show menu")
      expect(terminal).to receive(:puts).with("2. New order")
      new_customer = Takeaway.new(terminal)
      new_customer.menu_options
    end
  end

end

