require 'dish'

class Menu
  def initialize
    @menu = {
      "pasta" => 2.5,
      "chips" => 1.0,
      "olives" => 0.5,
      "pizza" => 3.0,
      "burger" => 2.5
    }
  end

  def add_dish(dish)
    @menu.store(dish.name, dish.price)
  end

  def show_menu
    return formated_menu = @menu.map do |item, price|
      "#{item.capitalize} : £#{"%.2f" % price.to_f}"
    end
  end
end

# Example code to populate menu with dishes
# new_menu = Menu.new
# pizza = Dish.new("pizza", 3.0)
# burger = Dish.new("burger", 2.5)
# salad = Dish.new("salad", 1.5)
# new_menu.add_dish(pizza)
# new_menu.add_dish(burger)
# new_menu.add_dish(salad)
# new_menu.show_menu