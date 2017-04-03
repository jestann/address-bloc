require_relative '../models/address_book'

class MenuController
    attr_reader :address_book
    
    def initialize
        @address_book = AddressBook.new
    end
    
    def main_menu
        puts "Main Menu - #{address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - View Entry Number n"
        puts "6 - Exit"
        print "Enter your selection: "
        selection = gets.to_i

        case selection
            when 1
                view_all_entries
                main_menu
            when 2
                create_entry
                main_menu
            when 3
                search_entries
                main_menu
            when 4
                read_csv
                main_menu
            when 5
                view_entry_n
                main_menu
            when 6
                puts "Goodbye!"
                puts " "
                exit(0)
            else
                puts "Sorry, that is not a valid input!"
                puts " "
                main_menu
        end
    end
    
    def view_all_entries
        address_book.entries.each do |entry|
            puts entry.to_s
            puts " "
            entry_submenu(entry)
        end
        puts "End of entries."
        puts " "
    end
    
    def create_entry
        puts "New AddressBloc Entry"
        print "Name: "
        name = gets.chomp
        print "Phone number: "
        phone = gets.chomp
        print "Email: "
        email = gets.chomp
        
        address_book.add_entry(name, phone, email)
        
        puts "New entry created."
        puts " "
    end
    
    def search_entries
        puts " "
    end
    
    def read_csv
        puts " "
    end
    
    def entry_submenu(entry)
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        
        selection = gets.chomp
        
        case selection
            when "n"
            when "d"
            when "e"
            when "m"
                main_menu
            else
                puts "#{selection} is not a valid input."
                puts " "
                entry_submenu(entry)
        end
    end
    
    def view_entry_n
        print "Entry Number: "
        entry_number = gets.chomp.to_i

        if entry_number >0 && entry_number <= address_book.entries.length
            puts address_book.entries[entry_number-1].to_s
            puts " "
        else
            puts "#{entry_number} is not a valid input."
            puts " "
            main_menu
        end
    end
end