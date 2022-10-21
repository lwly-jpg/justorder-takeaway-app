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