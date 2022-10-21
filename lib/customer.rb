class Customer

  def initialize(name, mobile)
    @name = name
    @mobile = mobile
  end

  def name
    return @name
  end

  def mobile
    return @mobile
  end

  def format_customer
    return "#{@name}: #{@mobile}"
  end
end