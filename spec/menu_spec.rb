require 'menu'

describe Menu do
  context 'when dishes are added to the menu' do
    it 'returns list of items on the menu with multiple dishes' do
      new_menu = Menu.new
      noodle_dish = double(:noodle_dish, name: "noodles", price: 3.0)
      mash_dish = double(:mash_dish, name: "mash", price: 2.5)
      salad_dish = double(:salad_dish, name: "salad", price: 1.5)
      new_menu.add_dish(noodle_dish)
      new_menu.add_dish(mash_dish)
      new_menu.add_dish(salad_dish)
      expect(new_menu.show_menu).to eq ["Pasta : £2.50", "Chips : £1.00", "Olives : £0.50", "Pizza : £3.00", "Burger : £2.50", "Noodles : £3.00", "Mash : £2.50", "Salad : £1.50"]
    end
  end
end