require 'account'
require 'accountList'
require 'loginForm'
require 'gameList'
require 'highline/import'

if ARGV.length > 0
  sel = 1
else
  puts "1. Login\n2.Register\nPlease choose an option:"
  STDOUT.flush
  sel = STDIN.gets.chomp.to_i
end

#Login
if sel == 1
  lf = LoginForm.new
  lf.set_username("Please enter your name:")
  lf.set_password("Please enter your password:")
  accounts = AccountList.new
  puts accounts.get_user(lf.name, lf.password)
  
  #accounts.add_user(lf.name, lf.password)
  #Admin
  if accounts.get_user(lf.name, lf.password) != nil && 
     accounts.get_user(lf.name, lf.password).privileges == 0
     
    acc = accounts.get_user(lf.name, lf.password)
     
    puts "Successfully logged in as ADMIN\n"
    while true do 
      puts "Select action you want to do:\n1.\tAdd user.\n2.\tList users\n0.\tExit"
      STDOUT.flush
      sel = STDIN.gets.chomp.to_i
      #Add user
      if sel == 1
        rf = LoginForm.new(nil,nil,1)
        rf.set_username("Please enter user's name:")
        while true do
          rf.set_password("Please enter user's password:")
          password = ask("Please enter your password again:") { |q| q.echo = "*" }
          if rf.password == password
            break
          end
        end
        rf.set_surname("Please enter user's surname:")
        msg = "Please enter your sex:\n1. Vyras\n2. Moteris\n"
        puts msg
        while true do
          STDOUT.flush
          sel = STDIN.gets.chomp.to_i
          if sel == 1
            lf.sex = "vyras"
            break
          elsif sel == 2
            lf.sex = "moteris"
            break
          elsif sel == 0
            puts "Program terminated."
            exit 1
          else
            puts "bad choice, #{msg.downcase}"
            next
          end
        end
        rf.set_privileges("Please enter user's privileges(0 - admin, 1 - leecher):")
        accounts.add_user(rf.name, rf.password, rf.surname, rf.sex, rf.privileges)
      #List games
      elsif sel == 2
        gl = GameList.new
        puts gl.print_games(true)
        puts "\n"
        puts "Add game to Cart ? (enter id./0 to go back to menu)"
        game = STDIN.gets.chomp.to_i
        acc.cart.add_game(game)
        puts acc.cart.to_s
      elsif sel == 3
        puts GameList.new
        puts "\n"
      #Exit
      elsif sel == 0
        break
      end
      #gl = GameList.new
      #gl.games.each_index {|i| puts "#{i}.\n#{gl.games[i]}"}
      #STDOUT.flush
      #status = STDIN.gets.chomp.to_i
      #description = STDIN.gets.chomp
      #rating = STDIN.gets.chomp.to_f
      #demo = STDIN.gets.chomp
      #url = STDIN.gets.chomp
      #gl.add_game(status, description, rating, demo, url)
    end
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


