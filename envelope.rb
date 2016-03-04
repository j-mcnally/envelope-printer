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

      fromaddress = "\n#{ENV['FROM_NAME']}\n#{ENV['FROM_ADDRESS_1']}"
      fromaddress << "\n#{ENV['FROM_ADDRESS_2']}" if !ENV['FROM_ADDRESS_2'].nil?
      fromaddress << "\n#{ENV['FROM_CITY']}, #{ENV['FROM_STATE']} #{ENV['FROM_ZIPCODE']}"

      spacing = "\n\n\n\n\n\n\n\n"
      indentation = "\t\t\t\t\t"

      address = "#{indentation}#{name}\n#{indentation}#{address1}\n"
      address << "#{indentation}#{address2}\n" if !address2.nil?
      address << "#{indentation}#{city}, #{state} #{zipcode}\n"

      print_text = "#{fromaddress}#{spacing}#{address}"

      job = printer.print_data(print_text, 'text/plain', {'landscape' => "yes", 'InputSlot' => ENV['INPUT_SLOT'], 'PageSize' => ENV['PAGE_SIZE']})

    end
  end
end
