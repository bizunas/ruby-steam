require 'account'
require 'accountList'
require 'loginForm'
#require 'gameList'
require 'news'
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
  
  acc = accounts.get_user(lf.name, lf.password)  

  #accounts.add_user(lf.name, lf.password)
  #Admin
  if acc != nil and acc.privileges == 0

    puts acc
    
    puts "Successfully logged in as ADMIN\n\n"
    while true do 
      puts "Select action you want to do:\n1.\tList users\n2.\tAdd user.\n3.\tList games\n4.\tGame options\n5.\tList News\n0.\tExit\n"
      STDOUT.flush
      sel = STDIN.gets.chomp.to_i
      
      #List users
      if sel == 1
        puts accounts.to_s
      #Add user
      elsif sel == 2
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
            rf.sex = "vyras"
            break
          elsif sel == 2
            rf.sex = "moteris"
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
      elsif sel == 3
        gl = GameList.new
        puts gl.print_games(false)
        puts "\n"
        puts "Add game to Cart ? (enter id./0 to go back to menu)"
        game = STDIN.gets.chomp.to_i
        acc.cart.add_game(game) if game != 0
        puts acc.cart.to_s
      #Game options
      elsif sel == 4
        gameList = GameList.new
        puts gameList
        puts "\n"
        puts "1.\tAdd game\n2.\tDelete game\n(enter id./0 to go back to menu): "
        s = STDIN.gets.chomp.to_i
        if s == 1
          puts "Please enter game name:"
          name = STDIN.gets.chomp
          puts "Please enter game status (0-7):"
          status = STDIN.gets.to_i
          puts "Please enter game description:"
          description = STDIN.gets.chomp
          puts "Please enter game rating:"
          rating = STDIN.gets.to_f           
          puts "Please enter game cost:"
          cost = STDIN.gets.chomp
          puts "Please enter game demo url:"
          demo = STDIN.gets.chomp
          puts "Please enter game url:"
          url = STDIN.gets.chomp
          #game = Game.new(name, status, description, rating, cost, demo, url)
          gameList.add_game(name, status, description, rating, cost, demo, url)
        elsif s == 2
          puts "Enter user id you want to delete: "
          gameList.delete_game(STDIN.gets.to_i)
        end
      #print news
      elsif sel == 5
        puts News.new.to_s
      #add a new
      elsif sel == 6
          puts "Please enter title:"
          title = STDIN.gets.chomp
          puts "Please enter content of new:"
          new = STDIN.gets.chomp         
          puts "Please enter author:"
          author = STDIN.gets.chomp
          puts "Please enter when it is published on:"
          published_on = STDIN.gets.chomp
          news = News.new
          news.add_new(title, new, author, published_on)
      #Exit
      elsif sel == 0
        break
      end
    end
  #leecher
  elsif acc != nil and acc.privileges == 1
    puts "Successfully logged in as #{acc.name}\n\n"
  else
    puts acc != nil
    puts acc.privileges == 1
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
    accList = AccountList.new
    accList.add_user(lf.name, lf.surname, lf.password, lf.sex, 0)
    puts "Successful registration"
  else
    puts "Please register again: bad password"
  end
#Bad selection
else
  puts "bad choice."
end


