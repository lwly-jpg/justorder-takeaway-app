require 'dish'
require 'menu'

class Basket
  
  def initialize
    @basket = {}
    @total = 0
    @menu = {
      "pasta" => 2.5,
      "chips" => 1.0,
      "olives" => 0.5,
      "pizza" => 3.0,
      "burger" => 2.5
    }
  end

  def add_dish(dish)
    fail "Invalid - dish is not on the menu." unless @menu.has_key?(dish.name)
    @basket.store(dish.name, dish.price)
  end

  def generate_total
    @total = @basket.map { |name, price| price}.sum
  end

  def format_basket
    formated_basket = @basket.map do |name, price|
      "#{name.capitalize} : £#{"%.2f" % price.to_f}"
    end
  end

  def show_basket
    "#{format_basket.join(", ")}. Total: £#{"%.2f" % @total}" 
  end

end