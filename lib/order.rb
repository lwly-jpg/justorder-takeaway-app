class Order
  def initialize
    @order = []
    @total = 0
  end

  def add_dish(dish)
    @order << dish
  end

  def generate_total
    @total = @order.map { |item| item.price}.sum
  end

  def format_order
    formated_order = @order.map do |item|
      "#{item.name.capitalize} : £#{"%.2f" % item.price}"
    end
  end

  def show_order
    "#{format_order.join(", ")}. Total: £#{"%.2f" % @total}" 
  end

end