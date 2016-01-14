class Address
  attr_reader(:street_address, :city, :state, :zip, :address_type)
  @@addresses = []

  define_method(:initialize) do |attributes|
    @street_address = attributes.fetch(:street_address)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @address_type = attributes.fetch(:address_type)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end
end
