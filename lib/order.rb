require_relative 'customer'
require_relative 'sms'
require 'dotenv'
Dotenv.load('twilio.env')

class Order

  def initialize(customer)
  # Initializes with existing menu, customer instance, empty basket and total at 0
    @menu = {
      "pasta" => 2.5,
      "chips" => 1.0,
      "olives" => 0.5,
      "pizza" => 3.0,
      "burger" => 2.5
    }

    @customer = customer
    @basket = []
    @total = 0
  end

  def show_menu
  # Returns menu items as a array of formatted strings with name and price
    return formated_menu = @menu.map do |item, price|
      "#{item.capitalize} : £#{"%.2f" % price.to_f}"
    end
  end

  def add_dish(dish)
  # Adds dish name and price to basket, raises error if dish is off menu
    fail "Invalid - dish is not on the menu." unless @menu.has_key?(dish)
    @basket << "#{dish.downcase.capitalize} x 1 @ £#{"%.2f" % @menu[dish].to_f}"
    @total += @menu[dish]
  end

  def check_stock(dish)
    @menu.has_key?(dish)
  end

  def check_basket
    @basket.empty?
  end

  def show_basket
  # Returns string of formatted basket list together with grand total
    fail "Empty basket! Add at least one dish first." if @basket.empty?
    return "#{@basket.join(", ")}. Total: £#{"%.2f" % @total}"
  end

  def submit_order
  # Sends SMS to confirm submission of order, raises if basket is empty
    fail "Basket empty - cannot submit empty order." if @basket.empty?
    new_sms = SMS.new(@customer)
    new_sms.send_sms
  end

end