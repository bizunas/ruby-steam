require 'account'
require 'loginForm'
require 'gameList'
require 'highline/import'

puts "1. Login\n2.Register\nPlease choose an option:"
STDOUT.flush
sel = STDIN.gets.chomp.to_i

#Login
if sel == 1
  lf = LoginForm.new
  lf.set_username("Please enter your name:")
  lf.set_password("Please enter your password:")
  account = Account.new(lf.name, lf.password)
  if account.get_user
    puts "successfully logged in".capitalize
    gl = GameList.new
    gl.games.each_index {|i| puts "#{i}.\n#{gl.games[i]}"}
    STDOUT.flush
    status = STDIN.gets.chomp.to_i
    description = STDIN.gets.chomp
    rating = STDIN.gets.chomp.to_f
    demo = STDIN.gets.chomp
    url = STDIN.gets.chomp
    gl.add_game(status, description, rating, demo, url)
    
  else
    puts "Bad username and/or password. Please try again."
  end

#Registration
elsif sel == 2
  lf = LoginForm.new
  lf.set_username("Please enter your name:")
  lf.set_surname("Please enter your surname:")

  msg = "Please enter your sex:\n1. Vyras\n2. Moteris\n"
  puts msg
  while true do
    STDOUT.flush
    sel = gets.chomp.to_i
    if sel == 1
      lf.sex = "vyras"
      break
    elsif sel == 2
      lf.sex = "moteris"
      break
    else
      puts "bad choice, #{msg.downcase}"
      next
    end
  end
  
  lf.set_password("Please enter new password:")
  password = ask("Please enter your password again:") { |q| q.echo = "*" }
  if (lf.password <=> password) == 0
    account = Account.new(lf.name, lf.surname, lf.password, lf.sex)
    account.save
    puts "Successful registration"
  else
    puts "Please register again: bad password"
  end
#Bad selection
else
  puts "bad choice."
end


