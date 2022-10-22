require_relative 'dish'

class Menu
  def initialize
    @menu = {}
  end

  def add_dish(dish)
    @menu.store(dish.name, dish.price)
  end

  def show_menu
    formated_menu = @menu.map do |item, price|
      "#{item.capitalize} : £#{"%.2f" % price}"
    end
  end
end

# Code to populate menu with dishes
pasta = Dish.new("pasta", 2.5)
chips = Dish.new("chips", 1.0)
olives = Dish.new("olives", 0.5)
default_menu = Menu.new
default_menu.add_dish(pasta)
default_menu.add_dish(chips)
default_menu.add_dish(olives)