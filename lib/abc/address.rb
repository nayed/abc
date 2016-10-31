class Address
  attr_accessor :kind, :street_1, :street_2, :city, :postal_code, :country, :state

  def to_s(format = 'short')
    address = ''
    case format
    when 'short'
      address += "#{kind}: "
      address += street_1
      if street_2
        address += " #{street_2}"
      end
      address += ", #{city}, #{postal_code}, #{country}"
    when 'long'
      address += street_1 + "\n"
      address += street_2 + "\n" unless street_2.nil?
      address += "#{city}, #{postal_code}, #{country}"
    end
    address
  end
end
