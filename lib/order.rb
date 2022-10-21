class Order
  def initialize
    @order = []
  end

  def add_dish(dish)
    @order << dish
  end

  def show_order
    formated_order = @order.map do |item|
      "#{item.name.capitalize} : £#{"%.2f" % item.price}"
    end
  end

end