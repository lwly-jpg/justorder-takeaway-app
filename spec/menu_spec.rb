require 'menu'

describe Menu do
  context 'when dishes are added to the menu' do
    it 'returns list of items on the menu with one dish' do
      new_menu = Menu.new
      new_menu.add_dish("pizza", 3.0)
      expect(new_menu.show_menu).to eq ["Pizza : £3.00"]
    end

    it 'returns list of items on the menu with multiple dishes' do
      new_menu = Menu.new
      new_menu.add_dish("pizza", 3.0)
      new_menu.add_dish("burger", 2.5)
      new_menu.add_dish("salad", 1.5)
      expect(new_menu.show_menu).to eq ["Pizza : £3.00", "Burger : £2.50", "Salad : £1.50"]
    end
  end
end