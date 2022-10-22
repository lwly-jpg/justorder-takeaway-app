require 'basket'

describe Basket do
  context 'when dishes are added' do
    it 'returns a single dish as formatted string' do
      new_basket = Basket.new
      pizza_dish = double(:pizza_dish, name: "pizza", price: 3.0)
      new_basket.add_dish(pizza_dish)
      expect(new_basket.format_basket).to eq ["Pizza : £3.00"]
    end

    it 'returns multiple dishes as formatted strings' do
      new_basket = Basket.new
      pizza_dish = double(:pizza_dish, name: "pizza", price: 3.0)
      burger_dish = double(:burger_dish, name: "burger", price: 2.5)
      new_basket.add_dish(pizza_dish)
      new_basket.add_dish(burger_dish)
      expect(new_basket.format_basket).to eq ["Pizza : £3.00", "Burger : £2.50"]
    end

    it 'generates total price of dishes in basket' do
      new_basket = Basket.new
      pizza_dish = double(:pizza_dish, name: "pizza", price: 3.0)
      burger_dish = double(:burger_dish, name: "burger", price: 2.5)
      new_basket.add_dish(pizza_dish)
      new_basket.add_dish(burger_dish)
      expect(new_basket.generate_total).to eq 5.5
    end

    it 'prints total price and dishes items in basket' do
      new_basket = Basket.new
      pizza_dish = double(:pizza_dish, name: "pizza", price: 3.0)
      burger_dish = double(:burger_dish, name: "burger", price: 2.5)
      new_basket.add_dish(pizza_dish)
      new_basket.add_dish(burger_dish)
      new_basket.generate_total
      expect(new_basket.show_basket).to eq ("Pizza : £3.00, Burger : £2.50. Total: £5.50")
    end

    it 'raises error when item does not exist on menu' do
      new_basket = Basket.new
      pizza_dish = double(:pizza_dish, name: "pizza", price: 3.0)
      rice_dish = double(:rice_dish, name: "rice", price: 2.5)
      new_basket.add_dish(pizza_dish)
      expect {new_basket.add_dish(rice_dish)}.to raise_error "Invalid - dish is not on the menu."
    end
  end
end