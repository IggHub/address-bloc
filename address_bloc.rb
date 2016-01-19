require_relative 'controllers/menu_controller'

# #4
menu = MenuController.new
# #5
system "clear"
puts "Welcome to AddressBloc!"
# #6

#entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
#entry2 = Entry.new('Nada Lovelace', 'nada', 'no email. Nada.')

menu.main_menu
