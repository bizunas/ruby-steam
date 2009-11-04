require 'account'
require 'highline/import'

class LoginForm
  attr_accessor :name, :surname, :password, :sex, :privileges

  def initialize(name = nil, password = nil, arg = 0)
    @name = name
    @password = password
    @arg = arg
  end

  def set_username(msg, name = nil)
    if name != nil then
      @name = name
    elsif(ARGV.length > 0 && @arg == 0) then
      @name = ARGV[0]
    else
      puts "#{msg}"
      STDOUT.flush
      @name = STDIN.gets.chomp
    end
  end

  def set_password(msg, password = nil)
    if password != nil
      @password = password
    elsif(ARGV.length > 1 && @arg == 0)
      @password = ARGV[1]
    else
      STDOUT.flush
      @password = ask(msg) { |q| q.echo = "*" }
    end
  end

  def set_surname(msg, surname = nil)
    if surname != nil
      @surname = surname
    else
      puts "#{msg}"
      STDOUT.flush
      @surname = STDIN.gets.chomp
    end
  end
  
  def set_privileges(msg, priv = nil)
    if priv != nil
      @privileges = priv
    else
      puts "#{msg}"
      STDOUT.flush
      @privileges = STDIN.gets.chomp
    end
  end
end
