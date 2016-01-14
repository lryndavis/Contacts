class Phone
  attr_reader(:phone_number, :phone_type)
  @@phones = []

  define_method(:initialize) do |attributes|
    @phone_number = attributes.fetch(:phone_number)
    @phone_type = attributes.fetch(:phone_type)
  end

  define_singleton_method(:clear) do
    @@phones = []
  end
end
