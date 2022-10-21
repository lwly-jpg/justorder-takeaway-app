require 'customer'

describe Customer do
  context 'it initially' do
    it 'returns name of customer' do
      new_customer = Customer.new("Harry", "07123456780")
      expect(new_customer.name).to eq "Harry"
    end

    it 'returns mobile number of customer' do
      new_customer = Customer.new("Harry", "07123456780")
      expect(new_customer.mobile).to eq "07123456780"
    end

    it 'returns customer name and mobile number as formatted string' do
      new_customer = Customer.new("Harry", "07123456780")
      expect(new_customer.format_customer).to eq "Harry: 07123456780"
    end
  end

end