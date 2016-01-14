class Address
  attr_reader(:street_address, :city, :state, :zip, :address_type)
  @@addresses = []

  define_method(:initialize) do |attributes|
    @street_address = attributes.fetch(:street_address)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@addresses
  end

  define_method(:save) do
    @@addresses.push(self)
  end

  define_method(:delete) do
    @@addresses.delete(self)
  end

  define_singleton_method(:clear) do
    @@addresses = []
  end
end
###not sure if find method is necessary here
  define_singleton_method(:find) do |id|
    found_contact = nil
    @@addresses.each() do |address|
      if address.id().eql?(id)
        found_address = address
      end
    end
    found_address
  end
