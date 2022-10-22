class Order

  def initialize(customer)
    @customer = customer
    @basket = []
  end

  def show_customer
    return "Name: #{@customer.name}, Mobile: #{@customer.mobile}"
  end

  def add_basket(basket)
    @basket = basket
  end

  def show_order
    return @basket.show_basket
  end

end