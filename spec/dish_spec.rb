## name of dish, price of dish

require 'dish'

describe Dish do
  context 'it initially' do
    it 'returns name of dish as formatted string' do
      new_dish = Dish.new("pizza", 3.0)
      expect(new_dish.name).to eq "Pizza"
    end

    it 'returns price of dish as formatted string' do
      new_dish = Dish.new("pizza", 3.0)
      expect(new_dish.price).to eq "£3.00"
    end

    it 'returns name and price of dish together as formatted string' do
      new_dish = Dish.new("pizza", 3.0)
      expect(new_dish.format_dish).to eq "Pizza : £3.00"
    end
  end
end