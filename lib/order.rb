require_relative 'customer'
require_relative 'dish'
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
    @basket = {}
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
    fail "Invalid - dish is not on the menu." unless @menu.has_key?(dish.name)
    @basket.store(dish.name, dish.price)
  end

  def show_basket
  # Returns string of formatted basket list together with grand total
    fail "Empty basket! Add at least one dish first." if @basket.empty?
    generate_total
    return "#{format_basket.join(", ")}. Total: £#{"%.2f" % @total}"
  end

  def submit_order
  # Sends SMS to confirm submission of order, raises if basket is empty
    fail "Basket empty - cannot submit empty order." if @basket.empty?
    new_sms = SMS.new(@customer)
    new_sms.send_sms
    return "Thanks for your order, #{@customer.name}. You will receive a confirmation text to your number: #{@customer.mobile}."
  end


  private

  def format_basket
  # Formats dish item names with capitals and price to GBP
    formated_basket = @basket.map do |name, price|
      "#{name.capitalize} : £#{"%.2f" % price.to_f}"
    end
  end

  def generate_total
  # Adds up price of each dish in basket
    @total = @basket.map { |name, price| price}.sum
  end

end