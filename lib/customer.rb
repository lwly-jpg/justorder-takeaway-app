class Customer

  def initialize(name, mobile)
  # Initialize with name and mobile number of customer
    @name = name
    @mobile = mobile
  end

  def name
  # Returns name of customer
    return @name
  end

  def mobile
  # Returns mobile number of customer
    return @mobile
  end

  def format_customer
  # Returns formatted string containing name and mobile number of customer
    return "#{@name}: #{@mobile}"
  end
end