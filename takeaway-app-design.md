## 1. Problem

As a customer so that I can
- check if I want to order something => I would like to see a list of dishes with prices.
- order the meal I want => I would like to be able to select some number of several available dishes.
- verify that my order is correct => I would like to see an itemised receipt with a grand total.
- know my order will be delivered on time => I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Class System

```ruby

class Takeaway
  def initialize
    # @dish, @customer, @order, @receipt, @menu??
  end

  def show_menu
    # returns dishes in menu
  end

  def show_receipt
    # returns customer and order details
  end

  def send_sms
    # sends SMS
  end
end

class Order

  def initialize
  # @dishes, @total????
  end

  def add_dish(dish)
  # add new dish instance to dishes
  end

  def show_order
  # returns dishes
  end

end

class Dish

  def initialize
  # @name, @price
  end

  def name
  # returns name of dish
  end

  def price
  # returns price of dish
  end

end

class Customer

  def initialize
  # @name, @mobile
  end

  def name
  # returns name of customer
  end

  def mobile
  # returns mobile number of customer
  end

end

class Receipt
  def initialize
  # @order, @menu
  end

  def order
  # returns order details
  end

  def menu
  # returns menu details
  # DO I WANT TO USE THIS AND NOT HAVE PRICES IN ORDER AND DISH?
  end

  def generate_total
  # returns itemised breakdown and total
  end

end

class SMS
  def initialize
  # @customer
  end
  
  def text
  # returns text message
  end

end
```

## 3. Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
-- Takeaway --


-- ORDER PROCESSOR --
# Processes the users order
# Allows user to add dishes to order
# Returns dishes selected by user
# Allows user to delete dishes from order

-- RECEIPT --
# Returns correct total price for items in the order
# Returns 0 if order is empty (or throws error?)
# Sends SMS to user after order has been processed
```

## 4. Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

``