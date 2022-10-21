require 'menu'

describe Menu do
  context 'when dishes are added to the menu' do
    it 'returns list of items on the menu with one dish' do
      new_menu = Menu.new
      pizza_dish = double(:pizza_dish, name: "pizza", price: 3.0)
      new_menu.add_dish(pizza_dish)
      expect(new_menu.show_menu).to eq ["Pizza : £3.00"]
    end

    it 'returns list of items on the menu with multiple dishes' do
      new_menu = Menu.new
      pizza_dish = double(:pizza_dish, name: "pizza", price: 3.0)
      burger_dish = double(:burger_dish, name: "burger", price: 2.5)
      salad_dish = double(:salad_dish, name: "salad", price: 1.5)
      new_menu.add_dish(pizza_dish)
      new_menu.add_dish(burger_dish)
      new_menu.add_dish(salad_dish)
      expect(new_menu.show_menu).to eq ["Pizza : £3.00", "Burger : £2.50", "Salad : £1.50"]
    end
  end
end