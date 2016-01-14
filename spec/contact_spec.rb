require('rspec')
require('contact')
require('pry')

describe(Contact) do
  before() do
    Contact.clear()
    @test_contact = Contact.new(:first_name => "Bob", :last_name => "Jones", :job_title => "janitor", :company => "Epicodus")
  end

  describe('#first_name') do
    it('returns the first name of the contact') do
      expect(@test_contact.first_name()).to(eq("Bob"))
    end
  end

  describe('#last_name') do
    it('returns the last name of the contact') do
      expect(@test_contact.last_name()).to(eq("Jones"))
    end
  end

  describe('#job_title') do
    it('returns the job title of the contact') do
      expect(@test_contact.job_title()).to(eq("janitor"))
    end
  end

  describe('#company') do
    it('returns the first name of the contact') do
      expect(@test_contact.company()).to(eq("Epicodus"))
    end
  end

  describe('#id') do
    it("returns the id of the contact") do
      expect(@test_contact.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns a contact by its id number') do
      @test_contact.save()
      test_contact2 = Contact.new(:first_name => "Jane", :last_name => "Doe", :job_title => "florist", :company => "FlowerCo")
      test_contact2.save()
      expect(Contact.find(test_contact2.id())).to(eq(test_contact2))
    end
  end

end
