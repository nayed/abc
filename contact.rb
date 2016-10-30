class Contact
  attr_accessor :first_name, :middle_name, :last_name

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
end

nayed = Contact.new
nayed.first_name = "Nayed"
nayed.last_name = "Saïd Ali"
puts nayed.to_s
puts nayed.to_s 'full_name'
puts nayed.to_s 'first_last'

jack = Contact.new
jack.first_name = "Jack"
jack.middle_name = "Jackouille"
jack.last_name = "De la Marmotter"
puts jack.to_s 'last_first'