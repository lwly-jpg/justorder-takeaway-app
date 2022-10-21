class Takeaway

  def initialize(terminal)
    @terminal = terminal
    @menu = {"pizza" => 3.0, "burger" => 2.0, "salad" => 2.0}
    @order = {}
  end

  def interactive_menu
  # Loads options on loop and takes user input from terminal
    loop do
      takeaway_options
      process_input(STDIN.gets.chomp.downcase)
    end
  end

  def takeaway_options
  # Prints out greeting and list of initial options for user
    @terminal.puts "Hello, welcome to JustOrder. How can I help you today?"
    @terminal.puts "1. Show menu"
    @terminal.puts "2. New order"
    @terminal.puts "3. Show current order"
    @terminal.puts "5. Exit"
  end

  def show_menu
  # Prints out each item in the menu and it's price in a formatted string
    @menu.each do |item, price|
      @terminal.puts "#{item.capitalize} : £#{"%.2f" % price}"
    end
  end

  def process_input(option_input)
  # Processes user input
    case option_input
      when "1", "show menu"
        show_menu
      when "2", "new order"
        add_item
      when "3", "show order"
        show_order
      when "5", "exit"
        exit
    end
  end

  def add_item
  # Gets user input, returns confirmation and adds item to order list
    loop do
      @terminal.puts "Input what item you'd like to order:"
      item_selection = @terminal.gets.chomp.downcase
      @order[item_selection] = @menu[item_selection]
      @terminal.puts "1 x #{item_selection.capitalize} added to your order. Anything else (Y/N)?"
      continue = @terminal.gets.chomp.upcase
      if continue == 'N'
        break
      end
    end 
  end

  def show_order
  # Prints what's currently in the users order
    @order.each do |item, price|
      @terminal.puts "#{item.capitalize} : £#{"%.2f" % price}"
    end
  end
end

## Code to run program ##
# my_order = Takeaway.new(Kernel)
# my_order.interactive_menu