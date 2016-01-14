require('Capybara/rspec')
require('./app')
require('launchy')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the contact addition path", {:type => :feature}) do
  it('it adds a contact to the contact list') do
    visit('/contacts/new')
    fill_in "first_name", :with => "Bob"
    click_button("Add Contact")
    expect(page).to have_content("SUCCESS!!!")
  end
end

describe('the new contact list path', {:type => :feature}) do
    it('adds a new contact and shows the list') do
      visit('/')
      click_link('Add New Contact')
      fill_in('first_name', :with => "Greg")
      fill_in('last_name', :with => "B")
      fill_in('job_title', :with => "C")
      fill_in('company', :with => "D")
      click_button('Add Contact')
      expect(page).to have_content("SUCCESS!!!")
      click_link('Back to Contact List')
      expect(page).to(have_content("Greg"))
    end
  end

describe('the view a contact path', {:type => :feature}) do
  it("shows a contact entry of a user's choice") do
    visit('/')
    click_link("Add New Contact")
    fill_in('first_name', :with => "Greg")
    fill_in('last_name', :with => "B")
    fill_in('job_title', :with => "C")
    fill_in('company', :with => "D")
    click_button("Add Contact")
    expect(page).to have_content("SUCCESS!!!")
    click_link('Back to Contact List')
    expect(page).to(have_content("Greg"))
    click_link('Greg B', match: :first)
    expect(page).to(have_content("Greg B C D"))
  end
end

# describe('the address form path', {:type => :feature}) do
#   it("will direct to the address entry form") do
#     visit('/')
#     click_link("Add New Contact")
#     fill_in('first_name', :with => "Greg")
#     fill_in('last_name', :with => "B")
#     fill_in('job_title', :with => "C")
#     fill_in('company', :with => "D")
#     click_button("Add Contact")
#     expect(page).to have_content("SUCCESS!!!")
#     click_link('Back to Contact List')
#     expect(page).to(have_content("Greg"))
#     click_link('Greg B', match: :first)
#     expect(page).to(have_content("Greg B C D"))
#     click_button("Add Address")
#     expect(page).to have_content("Address Form")
#   end
# end
