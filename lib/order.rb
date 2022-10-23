require_relative 'customer'
require_relative 'dish'
require_relative 'sms'
require 'dotenv'
Dotenv.load('twilio.env')

class Order

  def initialize(customer)
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
    return formated_menu = @menu.map do |item, price|
      "#{item.capitalize} : £#{"%.2f" % price.to_f}"
    end
  end

  def show_customer
    return "Name: #{@customer.name}, Mobile: #{@customer.mobile}"
  end

  def add_dish(dish)
    fail "Invalid - dish is not on the menu." unless @menu.has_key?(dish.name)
    @basket.store(dish.name, dish.price)
  end

  def show_basket
    fail "Empty basket! Add at least one dish first." if @basket.empty?
    generate_total
    return "#{format_basket.join(", ")}. Total: £#{"%.2f" % @total}"
  end

  def submit_order
    fail "Basket empty - cannot submit empty order." if @basket.empty?
    new_sms = SMS.new(@customer)
    new_sms.send_sms
  end


  private

  def format_basket
    formated_basket = @basket.map do |name, price|
      "#{name.capitalize} : £#{"%.2f" % price.to_f}"
    end
  end

  def generate_total
    @total = @basket.map { |name, price| price}.sum
  end

end