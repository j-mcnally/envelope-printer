require 'cupsffi'

class Envelope
  class << self
    def call(options)

      name = options[:name]
      address1 = options[:address1]
      address2 = options[:address2]
      city = options[:city]
      state = options[:state]
      zipcode = options[:zipcode]

      printer = CupsPrinter.new(ENV['PRINTER'])

      address = "\n#{name}\n#{address1}\n"
      address << "#{address2}\n" if !address2.nil?
      address << "#{city}, #{state} #{zipcode}\n"

      job = printer.print_data(address, 'text/plain', {'landscape' => "yes", 'InputSlot' => "ENV['INPUT_SLOT']", 'PageSize' => "ENV['PAGE_SIZE']"})

    end
  end
end
