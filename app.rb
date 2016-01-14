require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/address')
require('./lib/phone')
require('./lib/email')
require('./lib/contact')
require('pry')

get('/') do
  erb(:index)
end

get('/contacts/new') do
  erb(:contacts_form)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contact)
end

post('/contacts') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  job_title = params.fetch('job_title')
  company = params.fetch('company')
  @contacts = Contact.new(:first_name => first_name, :last_name => last_name, :job_title => job_title, :company => company)
  @contacts.save()
  @contacts = Contact.all()
  erb(:success)
end

get('/contacts/:id') do
  @contacts = Contact.find(params.fetch('id').to_i())
  erb(:contact_info)
end

get('/contacts/:id/address_form') do
  @contacts = Contact.find(params.fetch('id').to_i())
  erb(:address_form)
end

post('/contacts/:id') do
  @contacts = Contact.find(params.fetch('id').to_i())
  street_address = params.fetch('street_address')
  city = params.fetch('city')
  state = params.fetch('state')
  zip = params.fetch('zip')
  @address = Address.new(:street_address => street_address, :city => city, :state => state, :zip => zip)
  @address.save()
  @contacts.addresses().push(@address)
  @addresses = Address.all()
  erb(:success)
end

get('/contacts/:id/email_form') do
  @contacts = Contact.find(params.fetch('id').to_i())
  erb(:email_form)
end

 post('/contacts/:id/new_email') do
   @contacts = Contact.find(params.fetch('id').to_i())
   email_address = params.fetch('email_address')
   email_type = params.fetch('email_type')
   @email = Email.new(:email_address => email_address, :email_type => email_type)
   @email.save()
   @contacts.emails().push(@email)
   @emails = Email.all()
   erb(:success)
 end

 get('/contacts/:id/phone_form') do
   @contacts = Contact.find(params.fetch('id').to_i())
   erb(:phone_form)
 end

  post('/contacts/:id/new_phone') do
    @contacts = Contact.find(params.fetch('id').to_i())
    phone_number = params.fetch('phone_number')
    phone_type = params.fetch('phone_type')
    @phone = Phone.new(:phone_number => phone_number, :phone_type => phone_type)
    @phone.save()
    @contacts.phones().push(@phone)
    @phones = Phone.all()
    erb(:success)
  end

post('/') do
  clear = Contact.clear()
  erb(:success)
end
