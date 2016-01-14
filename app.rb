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

# get ('/delete_contact/:id') do
#   @contacts = Contact.find(params.fetch('id').to_i())
#   @contacts.delete()
#   erb(:success)
# end

# post('/emails') do
#   email_address = params.fetch('email_address')
#   email_type = params.fetch('email_type')
#   @email = Email.new(email_address, email_type)
#   @email.save()
#   @contacts = Contact.find(params.fetch('contact_id').to_i())
#   @contacts.add_vehicle(@email)
#   erb(:success)
# end

post('/') do
  clear = Contact.clear()
  erb(:clear)
end
