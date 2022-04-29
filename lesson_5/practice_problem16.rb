# Write a method that returns one UUID when called with no parameters.

# require 'securerandom'

# def uuid
#   SecureRandom.uuid
# end

def generate_uuid
  uuid = ''
  count = 0

  until count == 32
    generate_num = rand(10)
    generate_str = %w(a b c d e f).sample
    generate_hex_char = [generate_num, generate_str].sample.to_s

    uuid += generate_hex_char
    count += 1
  end

  arr = [8, 13, 18, 23]
  arr.each { |idx| uuid.insert(idx, '-') }

  uuid
end


p generate_uuid
