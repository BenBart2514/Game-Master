puts 'Welcome to Game Master'
puts 'To begin, select one of the following options'
puts '1. Character Creator'
puts '2. Dice Roller and Coin Flipper'
puts '3. Damage and Healing Calculator'
puts "For more information about this menu, enter 'H' or to exit the program, enter 'X'"
input = gets.chomp.capitalize
if input == 'X'
  exit
elsif input == 'H'
# display help
elsif input == '1'
  puts 'CC under construction'
elsif input == '2'
  puts 'DRCF under construction'
elsif input == '3'
  puts 'DaHC under construction'
else
  puts 'Not a valid input'
end
