require('rspec')
require('address')
require('pry')

describe(Address) do
  before() do
    Address.clear()
    @test_address = Address.new(:street_address => "123 Generic Drive", :city => "Portland", :state => "OR", :zip  => "97225", :address_type => "Home")
  end

  describe('#street_address') do
    it('returns the street address of the contact') do
      expect(@test_address.street_address()).to(eq("123 Generic Drive"))
    end
  end

  describe('#city') do
    it('returns the city of the contact') do
      expect(@test_address.city()).to(eq("Portland"))
    end
  end

  describe('#state') do
    it('returns the state of the contact') do
      expect(@test_address.state()).to(eq("OR"))
    end
  end

  describe('#zip') do
    it('returns the zip of the contact') do
      expect(@test_address.zip()).to(eq("97225"))
    end
  end

  describe('#address_type') do
    it('returns the address of the contact') do
      expect(@test_address.address_type()).to(eq("Home"))
    end
  end
end
