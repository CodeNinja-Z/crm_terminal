# require 'pry'
require_relative './rolodex.rb'

class CRM
  attr_accessor :name

  def self.run(name)
    crm = CRM.new(name)
    # crm = self.new(name)
    # crm = new(name)
    crm.main_menu
  end

  def initialize(name = "BitMakerLabs")
    @name = name
    @rolodex = Rolodex.new

    @rolodex.add_contact("irwin", "chan", "asdfasdfasd", "asdfasdfasdf")
    @rolodex.add_contact("sherry", "Donalds", "ghdfgdfgdg", "lsdfjlkkla")
    @rolodex.add_contact("Bret", "Hart", "jskdfa;", "mfoasdlfaj;sdf")
    @rolodex.add_contact("Gary", "Perry", "fooo@bar", "pwnpwnow")
    @rolodex.add_contact("Bruce", "Wayne", "jskaf;klsd;f", "cxvxcvxcvxvc")
    @rolodex.add_contact("Spider", "Man", "sdfsdfsdfsdfs", "notes notes notes")
  end

  # This is what attr_accessor does
  # def title
  #   @title
  # end  

  # def title=(new_title)
  #   @title = new_title
  # end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Display a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Delete a contact"
    puts "[7] Exit"
  end

  def main_menu
    while true
      print_main_menu
      print "Choose an option (type a number): "
      user_input = gets.chomp.to_i
      break if user_input.to_i == 7
      choose_option(user_input)
    end 
  end

  def choose_option(input)
    case input
    when 1 then add_contact
    when 2 then modify_contact
    when 3 then display_a_contact
    when 4 then display_all_contacts
    when 5 then display_contact_attribute
    when 6 then delete_contact
    when 7 then exit
    else
      puts "There isn't such option. Please input an option again: "  
    end  
  end

  def add_contact
    print "First name: "
    first_name = gets.chomp

    print "Last name: "
    last_name = gets.chomp

    print "Email: "
    email = gets.chomp
    #binding.pry  # pry is a breakpoint

    print "Notes: "
    notes = gets.chomp

    @rolodex.add_contact(first_name, last_name, email, notes)
  end

  def modify_contact
    print "Enter an ID for the contact to be modified: "
    id = gets.chomp.to_i
    print "Is ID: #{id} you want to modify? "
    option = gets.chomp.upcase
    if option == 'Y'
      contact_to_modify = @rolodex.find_contact_by_id(id)
      if @rolodex.found == true
        puts "Select the field you want to modify:"
        puts "[1] Change firstname"
        puts "[2] Change lastname"
        puts "[3] Change email"
        puts "[4] Change notes"
        print "Choose an option: "
        attr_to_change = gets.chomp.to_i
        while !(1..4).include? (attr_to_change)
          puts "Please enter a valid number"
          attr_to_change = gets.chomp.to_i
        end
        print "Enter new attribute value: "
        new_value = gets.chomp
      end
    end
    @rolodex.modify_contact(contact_to_modify, attr_to_change, new_value)
  end

  def display_a_contact
    print "Enter the ID of contact that you want to display: "
    id = gets.chomp.to_i
    @rolodex.display_a_contact(id)
  end

  def display_all_contacts
    @rolodex.display_all_contacts
  end

  def display_contact_attribute
    puts "What attribute would you like to display (type a number): "
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "[4] Notes"
    attr_to_display = gets.chomp.to_i
    @rolodex.display_contact_attribute(attr_to_display)
  end

  def delete_contact
    print "Enter the ID of contact you want to delete: "
    id = gets.chomp.to_i
    @rolodex.delete_contact(id)
    puts "Contact Deleted"
  end

  def clear_term
    puts "\e[H\e[2J"
  end

end

CRM.run("BitMakerLabs CRM")
#crm.main_menu  # Can't be done, causing error
# my_crm = CRM.new
# my_crm.main_menu

# my_crm.title # => "BitMakerLabs"
# my_crm.title = "Something else"