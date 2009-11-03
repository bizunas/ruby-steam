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
    if(ARGV.length > 0 && @arg == 0)
      @name = ARGV[0]
    elsif
      @name ||= name
    else
      puts "#{msg}"
      STDOUT.flush
      @name = STDIN.gets.chomp
    end
  end

  def set_password(msg, password = nil)
    if(ARGV.length > 1 && @arg == 0)
      @password = ARGV[1]
    elsif
      @password ||= password
    else
      STDOUT.flush
      @password = ask(msg) { |q| q.echo = "*" }
    end
  end

  def set_surname(msg, surname = nil)
    puts "#{msg}"
    STDOUT.flush
    @surname = STDIN.gets.chomp
  end
  
  def set_privileges(msg, priv = nil)
    puts "#{msg}"
    STDOUT.flush
    @privileges = STDIN.gets.chomp
  end
end
