require "./phone_number"
require "./address"

class Contact
  attr_accessor :first_name, :middle_name, :last_name
  attr_reader :phone_numbers, :addresses

  def initialize
    @phone_numbers = []
    @addresses = []
  end

  def add_phone_number(kind, number)
    phone_number = PhoneNumber.new
    phone_number.kind = kind
    phone_number.number = number
    phone_numbers << phone_number
  end

  def add_address(kind, street_1, street_2, city, postal_code, country, state)
    address = Address.new
    address.kind = kind
    address.street_1 = street_1
    address.street_2 = street_2
    address.city = city
    address.postal_code = postal_code
    address.country = country
    address.state = state
    addresses << address
  end

  def first_last
    "#{first_name} #{last_name}"
  end

  def last_first
    last_first = last_name
    last_first += ", "
    last_first += first_name
    unless middle_name.nil?
      last_first += " "
      last_first += middle_name[0]
      last_first += "."
    end
    last_first
  end

  def full_name
    full_name = first_name
    unless middle_name.nil?
      full_name += " "
      full_name += middle_name
    end
    full_name += " "
    full_name += last_name
    full_name
  end

  def to_s(format = 'full_name')
    case format
    when 'full_name'
      full_name
    when 'last_first'
      last_first
    when 'first'
      first_name
    when 'last'
      last_first
    else
      first_last
    end
  end

  def print_phone_numbers
    puts "Phone Numbers"
    phone_numbers.each { |phone_number| puts phone_number }
  end

  def print_addresses
    puts "Addresses"
    addresses.each { |address| puts address.to_s 'short' }
  end
end

nayed = Contact.new
nayed.first_name = "Nayed"
nayed.last_name = "Saïd Ali"
nayed.add_phone_number "Home", "01-23-45-67-89"
nayed.add_phone_number "Work", "98-76-54-32-10"
nayed.add_address("Home", "123 rue du Ruby", "", "Lyon", "69800", "France", "")
puts nayed.to_s 'full_name'
nayed.print_phone_numbers
nayed.print_addresses

# jack = Contact.new
# jack.first_name = "Jack"
# jack.middle_name = "Jackouille"
# jack.last_name = "De la Marmotter"
# puts jack.to_s 'last_first'