module PhoneNumber
  def self.clean(phone_number)
    cleaned = phone_number.gsub(/\D/, '')
    cleaned[-10..] if valid?(cleaned)
  end

  def self.valid?(phone_number)
    country_code = phone_number[0] if phone_number.length == 11
    rest_of_number = country_code ? phone_number[1..] : phone_number
    area_code = rest_of_number[0..2]
    exchange_code = rest_of_number[3..5]

    valid_length = rest_of_number.length == 10 ||
                   rest_of_number.length == 11
    valid_country_code = country_code == '1' ||
                         country_code.nil?
    valid_area_code = area_code[0] != '0' &&
                      area_code[0] != '1'
    valid_exchange_code = exchange_code[0] != '0' &&
                          exchange_code[0] != '1'

    valid_length &&
      valid_country_code &&
      valid_area_code &&
      valid_exchange_code
  end
end
