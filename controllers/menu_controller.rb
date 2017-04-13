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
        puts " "

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
        print "Search by name: "
        name = gets.chomp
        match = address_book.binary_search(name)
        puts " "
        
        if match
            puts match.to_s
            puts " "
            search_submenu(match)
        else
            puts "No match found for #{name}."
            puts " "
        end
    end
    
    def search_submenu(entry)
        puts "\nd - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        selection = gets.chomp
        
        case selection
            when "d"
                puts " "
                delete_entry(entry)
                main_menu
            when "e"
                puts " "
                edit_entry(entry)
                main_menu
            when "m"
                puts " "
                main_menu
            else
                puts " "
                puts "#{selection} is not a valid input"
                puts entry.to_s
                search_submenu(entry)
        end
    end
    
    def read_csv
        print "Enter CSV file to import: "
        file_name = gets.chomp
        
        if file_name.empty?
            puts "No CSV file read."
            puts " "
            main_menu
        end
        
        begin
            entry_count = address_book.import_from_csv(file_name).count
            puts "#{entry_count} new entries added from #{file_name}"
            puts " "
        rescue
            puts "#{file_name} is not a vaild CSV file. Please enter the name of a valid CSV file."
            puts " "
            read_csv
        end
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
                delete_entry(entry)
            when "e"
                edit_entry(entry)
                entry_submenu(entry)
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
    
    def delete_entry(entry)
        address_book.entries.delete(entry)
        puts "#{entry.name} has been deleted."
        puts " "
    end
    
    def edit_entry(entry)
        print "Updated name: "
        name = gets.chomp
        print "Updated phone number: "
        phone_number = gets.chomp
        print "Updated email: "
        email = gets.chomp
        
        entry.name = name if !name.empty?
        entry.phone_number = phone_number if !phone_number.empty?
        entry.email = email if !email.empty?
        puts " "
        puts "Updated entry:"
        puts entry
        puts " "
    end
end