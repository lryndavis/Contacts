require('rspec')
require('email')
require('pry')

describe(Email) do
  before() do
    Email.clear()
    @test_email = Email.new(:email_address => "address@address.com", :email_type => "Personal")
  end

  describe('#email_address') do
    it('returns the email address of the contact') do
      expect(@test_email.email_address()).to(eq("address@address.com"))
    end
  end

  describe('#email_type') do
    it('returns the email type of the contact') do
      expect(@test_email.email_type()).to(eq("Personal"))
    end
  end
end
