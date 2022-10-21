class Dish
  def initialize(name, price)
    @name = name
    @price = price
  end

  def name
    return @name.capitalize
  end

  def price
    return "£#{"%.2f" % @price}"
  end

  def format_dish
    return "#{@name.capitalize} : £#{"%.2f" % @price}"
  end

end