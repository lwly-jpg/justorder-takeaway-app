class Takeaway
  def initialize(terminal)
    @terminal = terminal
  end

  def menu_options
    @terminal.puts "Hello, welcome to JustOrder. How can I help you today?"
    @terminal.puts "1. Show menu"
    @terminal.puts "2. New order"
  end
end

      # 1. Show menu
      # 2. Choose dishes #takes user input and stores choices in array / hash? 
      # keeps asking if anything else is needed until user inputs "no"
      # 3. Remove dish #takes user input and removes element from hash
      # 4. See order #returns total and breakdown
      # 5. Submit order #returns success message and sends text message