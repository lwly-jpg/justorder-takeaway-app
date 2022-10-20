class Takeaway

  def initialize(terminal)
    @terminal = terminal
    @menu = {"Pizza" => 3.00, "Burger" => 2.00, "Salad" => 2.00}
  end

  def takeaway_options
    @terminal.puts "Hello, welcome to JustOrder. How can I help you today?"
    @terminal.puts "1. Show menu"
    @terminal.puts "2. New order"
  end

  def show_menu
    @menu.each do |item, price|
      @terminal.puts "#{item} : #{price}"
    end
  end
end