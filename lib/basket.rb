class Basket
  def initialize
    @basket = {}
    @total = 0
  end

  def add_dish(dish)
    @basket.store(dish.name, dish.price)
  end

  def generate_total
    @total = @basket.map { |name, price| price}.sum
  end

  def format_basket
    formated_basket = @basket.map do |name, price|
      "#{name.capitalize} : £#{"%.2f" % price}"
    end
  end

  def show_basket
    "#{format_basket.join(", ")}. Total: £#{"%.2f" % @total}" 
  end

end