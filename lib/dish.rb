class Dish
  def initialize(name, price)
    @name = name
    @price = price
  end

  def name
    return @name
  end

  def price
    return @price
  end

  def format_dish
    return "#{@name.capitalize} : £#{"%.2f" % @price.to_f}"
  end

end