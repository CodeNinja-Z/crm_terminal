require_relative('contact.rb')

class Rolodex
  attr_accessor :contacts, :found, :first_names, :last_names, :emails, :notes
  @@id = 1000

  def initialize
    @contacts = []
  end

  def add_contact(first_name, last_name, email, note)
    contact = Contact.new(@@id, first_name, last_name, email, note)
    @@id += 1
    @contacts << contact
  end

  # alternative of find contact, use method '.find'
  def find_contact_by_id(id)
     @contacts.each do |contact|
        if id == contact.id
          @found = true
          return contact
       end
     end
     @found = false
     puts "There is no record for ID: #{id}"
  end

  def modify_contact(contact_to_modify, attr_to_change, new_value)
    if @found == true
      case attr_to_change
        when 1 
          contact_to_modify.first_name = new_value
          puts "First name has been changed!"
          puts
        when 2 
          contact_to_modify.last_name = new_value
          puts "Last name has been changed!"
          puts
        when 3
          contact_to_modify.email = new_value
          puts "Email has been changed!"
          puts
        when 4 
          contact_to_modify.notes = new_value
          puts "Notes has been changed!"
          puts
      end 
    end
  end

  def display_a_contact(id)
    contact_to_display = find_contact_by_id(id)
    if @found == true
      print "ID: #{contact_to_display.id} / Name: #{contact_to_display.full_name} / "
      print "Email: #{contact_to_display.email} / Notes: #{contact_to_display.notes}"
    end
    puts
  end

  def display_all_contacts
    @contacts.each do |contact|
      print "ID: #{contact.id} / Name: #{contact.full_name} /  "
      print "Email: #{contact.email} / Notes: #{contact.notes}"
    end
    puts
  end

  def display_contact_attribute(attr_to_display)
    @first_names = @last_names = @emails = @notes =[]
    case attr_to_display
      when 1 
        @contacts.each do |contact|
          @first_names << contact.first_name
        end
        puts @first_names
      when 2 
        @contacts.each do |contact|
          @last_names << contact.last_name
        end
        puts @last_names
      when 3
        @contacts.each do |contact|
          @emails << contact.email
        end
        puts @emails
      when 4 
        @contacts.each do |contact|
          @notes << contact.notes
        end
        puts @notes
    end 
  end

  def delete_contact(id)
    @contacts.delete(contact)
  end

  def all
    @contacts
  end
end
