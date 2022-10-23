class Dish
  def initialize(name, price)
  # Initialize with name and price of dish
    @name = name
    @price = price
  end

  def name
  # Returns name of dish, unformatted
    return @name
  end

  def price
  # Returns price of dish, as unformatted float
    return @price
  end

  def format_dish
  # Returns formatted string with name and price of dish
    return "#{@name.capitalize} : £#{"%.2f" % @price.to_f}"
  end

end