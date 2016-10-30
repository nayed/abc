require "./contact"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def print_contact_list
    puts "Contact List:"
    contacts.each do |contact|
      puts contact.to_s 'last_first'
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
jack.add_phone_number "Home", "01-01-01-01-01"
jack.add_address("Home", "69 rue de l'elixir", "", "Lyon", "69800", "France", "")

address_book.contacts << nayed
address_book.contacts << jack
address_book.print_contact_list