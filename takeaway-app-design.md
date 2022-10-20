## 1. Problem

As a customer so that I can
- check if I want to order something => I would like to see a list of dishes with prices.
- order the meal I want => I would like to be able to select some number of several available dishes.
- verify that my order is correct => I would like to see an itemised receipt with a grand total.
- know my order will be delivered on time => I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Class System

```ruby
class Takeaway
  MENU = {}
  
  
  def initialize
  end

  def options
    # loop do
    #   print_options
    #   process(STDIN.gets.chomp)
    # end
  end

  def print_options
  # shows list of options for user
      # 1. Show menu #lists out menu items and prices
      # 2. Choose dishes #takes user input and stores choices in array / hash? 
      # keeps asking if anything else is needed until user inputs "no"
      # 3. Remove dish #takes user input and removes element from hash
      # 4. See order #returns total and breakdown
      # 5. Submit order #returns success message and sends text message
  end

  def show_menu
  # prints out menu
  end

  def place_order
  # process menu input
  end

end

class OrderProcessor
  def initialize
  # initialise as empty hash?
  end

  def add
  # add new item to order
  end

  def remove
  # remove item from order
  end

  def display
  # display items currently in order
  end
end

class ReceiptGenerator
  def initialize
  # initialize with instance of Order?
  end

  def total
  # totals up items in Order <- does this belong here?
  end

  def output
  # outputs itemised list
  end
end

class SMSSender
  def initialize
  # initialize with instance of Order?
  end

  def send
  # sends confirmation message
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