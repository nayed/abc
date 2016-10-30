require "./contact"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include? search
        results << contact
      end
    end
    print_results("Name search results (#{search})", results)
  end

  def find_by_phone_number(number)
    results = []
    search = number.gsub("-", "")
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub("-", "").include? search
          results << contact unless results.include? contact
        end
      end
    end
    print_results("Phone search results (#{search})", results)
  end

  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').downcase.include? search
          results << contact unless results.include? contact
        end
      end
    end
    print_results("Address search results (#{search})", results)
  end

  def print_contact_list
    puts "Contact List:"
    contacts.each do |contact|
      puts contact.to_s 'last_first'
    end
  end

  def print_results(search, results)
    puts search
    results.each do |contact|
      puts contact.to_s 'full_name'
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end
end

address_book = AddressBook.new

nayed = Contact.new
nayed.first_name = "Nayed"
nayed.last_name = "Saïd Ali"
nayed.add_phone_number "Home", "01-23-45-67-89"
nayed.add_phone_number "Work", "98-76-54-32-10"
nayed.add_address("Home", "123 rue du Ruby", "", "Lyon", "69800", "France", "")

jack = Contact.new
jack.first_name = "Jack"
jack.middle_name = "Jackouille"
jack.last_name = "De la Marmotter"
jack.add_phone_number "Home", "11-11-11-11-11"
jack.add_address("Home", "69 rue de l'elixir", "", "Lyon", "69800", "France", "")

address_book.contacts << nayed
address_book.contacts << jack

#address_book.print_contact_list
#address_book.find_by_name "z"
#address_book.find_by_phone_number "1"
address_book.find_by_address "ru"