class Takeaway

  def initialize(terminal)
    @terminal = terminal
    @menu = {"pizza" => 3.0, "burger" => 2.0, "salad" => 2.0}
    @order = {}
  end

  def takeaway_options
    # Prints out greeting and list of initial options for user
    @terminal.puts "Hello, welcome to JustOrder. How can I help you today?"
    @terminal.puts "1. Show menu"
    @terminal.puts "2. New order"
  end

  def show_menu
  # Prints out each item in the menu and it's price in a formatted string
    @menu.each do |item, price|
      @terminal.puts "#{item.capitalize} : £#{"%.2f" % price}"
    end
  end

  def add_item
  # Gets user input, returns confirmation and adds item to order list
    @terminal.puts "Input what item you'd like to order:"
    item_selection = @terminal.gets.chomp.downcase
    @terminal.puts "1 x #{item_selection.capitalize} added to your order"
    @order[item_selection] = @menu[item_selection]
  end

  def show_order
  # Shows what's currently in the users order
    @order
  end
end