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

      kohaddress = "\nKohactive\n800 W. Huron St.\nSuite 3E\nChicago, IL 60642"
      spacing = "\n\n\n\n\n\n\n\n"
      indentation = "\t\t\t\t\t"

      address = "#{indentation}#{name}\n#{address1}\n"
      address << "#{indentation}#{address2}\n" if !address2.nil?
      address << "#{indentation}#{city}, #{state} #{zipcode}\n"

      print_text = "#{kohaddress}#{spacing}#{address}"

      job = printer.print_data(print_text, 'text/plain', {'landscape' => "yes", 'InputSlot' => ENV['INPUT_SLOT'], 'PageSize' => ENV['PAGE_SIZE']})

    end
  end
end
