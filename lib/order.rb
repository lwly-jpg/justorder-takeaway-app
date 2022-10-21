class Order
  def initialize
    @order = {}
    @total = 0
  end

  def add_dish(dish)
    @order.store(dish.name, dish.price)
  end

  def generate_total
    @total = @order.map { |name, price| price}.sum
  end

  def format_order
    formated_order = @order.map do |name, price|
      "#{name.capitalize} : £#{"%.2f" % price}"
    end
  end

  def show_order
    "#{format_order.join(", ")}. Total: £#{"%.2f" % @total}" 
  end

end