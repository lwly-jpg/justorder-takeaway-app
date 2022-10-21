require 'order'

describe Order do
  context 'when dishes are added' do
    it 'returns a single dish as formatted string' do
      new_order = Order.new
      pizza_dish = double(:pizza_dish, name: "pizza", price: 3.0)
      new_order.add_dish(pizza_dish)
      expect(new_order.format_order).to eq ["Pizza : £3.00"]
    end

    it 'returns multiple dishes as formatted strings' do
      new_order = Order.new
      pizza_dish = double(:pizza_dish, name: "pizza", price: 3.0)
      burger_dish = double(:burger_dish, name: "burger", price: 2.5)
      new_order.add_dish(pizza_dish)
      new_order.add_dish(burger_dish)
      expect(new_order.format_order).to eq ["Pizza : £3.00", "Burger : £2.50"]
    end

    it 'generates total price of dishes in order' do
      new_order = Order.new
      pizza_dish = double(:pizza_dish, name: "pizza", price: 3.0)
      burger_dish = double(:burger_dish, name: "burger", price: 2.5)
      new_order.add_dish(pizza_dish)
      new_order.add_dish(burger_dish)
      expect(new_order.generate_total).to eq 5.5
    end

    it 'prints total price and dishes items in order' do
      new_order = Order.new
      pizza_dish = double(:pizza_dish, name: "pizza", price: 3.0)
      burger_dish = double(:burger_dish, name: "burger", price: 2.5)
      new_order.add_dish(pizza_dish)
      new_order.add_dish(burger_dish)
      new_order.generate_total
      expect(new_order.show_order).to eq ("Pizza : £3.00, Burger : £2.50. Total: £5.50")
    end
  end
end