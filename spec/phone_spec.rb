require('rspec')
require('phone')
require('pry')

describe(Phone) do
  before() do
    Contact.clear()
    @test_phone = Phone.new(:phone_number => "555-555-5555", :phone_type => "Cell")
  end

  describe('#phone_number') do
    it('returns the phone number of the contact') do
      expect(@test_phone.phone_number()).to(eq("555-555-5555"))
    end
  end

  describe('#phone_type') do
    it('returns the phone type of the contact') do
      expect(@test_phone.phone_type()).to(eq("Cell"))
    end
  end
end
