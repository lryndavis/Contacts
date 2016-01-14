class Contact
  attr_reader(:first_name, :last_name, :job_title, :company)
  @@contacts = []

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @contact_info = []
    @id = @@contacts.length().+1
    @addresses = []
  end


  define_method(:contact_info) do
    @contact_info
  end

  define_method(:id) do
    @id
  end

  define_method(:addresses) do
    @addresses
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_method(:delete) do
    @@contacts.delete(self)
  end

  define_method(:add_email) do |email|
    @emails.push(email)
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end
end
