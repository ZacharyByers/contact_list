def printer(arr)
  arr.each do |contact|
    contact.each { |key, value| puts "#{key}: #{value}" }
    puts ""
  end
end

def name_get()
  puts "Enter name"
  $stdin.gets.strip
end

def phone_get()
  puts "Enter phone number"
  $stdin.gets.strip
end

def email_get()
  puts "Enter email"
  $stdin.gets.strip
end

def address_get()
  puts "Enter address"
  $stdin.gets.strip
end

def contains_check(name, arr)
  exists = false
  arr.each do |element|
    if element.has_value?(name)
      exists = true
    end
  end
  exists
end


contact_list = []

puts "--Contact List--"

#run the script until the user wants to exit
while true
  puts "1) View All Contacts"
  puts "2) Add a Contact"
  puts "3) Edit a Contact"
  puts "4) Delete a Contact"
  puts "5) Exit"

  choice = gets.chomp.to_i

  case choice
  when 1
    printer(contact_list)
  when 2
    name = name_get

    phone = phone_get

    email = email_get

    address = address_get

    #put all the info from the user into a hash at index 'i' in the array
    contact_list << {name: name, phone: phone, email: email, address: address}

  when 3
    puts "Enter the name of the contact to edit"
    name1 = $stdin.gets.strip

    if !contains_check(name1, contact_list)
      puts "That contact does not exist"
    else
      contact_list.each do |element|
        if element[:name] == name1
          puts "1) Edit name"
          puts "2) Edit phone number"
          puts "3) Edit email"
          puts "4) Edit address"
          puts "5) Edit all"

          option = $stdin.gets.strip.to_i

          case option
          when 1
            element[:name] = name_get
          when 2
            element[:phone] = phone_get
          when 3
            element[:email] = email_get
          when 4
            element[:address] = address_get
          when 5
            element[:name] = name_get

            element[:phone] = phone_get

            element[:email] = email_get

            element[:address] = address_get
          else
            puts "Error"
          end
        end
      end
    end

  when 4
    puts "Enter the name of the contact to be deleted"
    name2 = $stdin.gets.strip

    if !contains_check(name2, contact_list)
      puts "That contact does not exist"
    else
      contact_list.each_with_index do |element, i|
        if element[:name] == name2
          contact_list.delete_at(i)
        end
      end
    end


  when 5
    exit 0
  else
    puts "Invalid input. Please try again."
  end
end
