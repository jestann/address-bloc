require_relative 'controllers/menu_controller'

menu = MenuController.new

system "clear"
puts " "
puts "Welcome to Cardfile!"

menu.main_menu