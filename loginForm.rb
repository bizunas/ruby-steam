# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'account'
require 'highline/import'

class LoginForm
  attr_accessor :name, :surname, :password, :sex

  def initialize(name = nil, password = nil)
    @name = name
    @password = password
  end

  def set_username(msg, name = nil)
    if(ARGV.length > 0)
      @name = ARGV[0]
    elsif
      @name ||= name
    else
      puts "#{msg}"
      STDOUT.flush
      @name = gets.chomp
    end
  end

  def set_password(msg, password = nil)
    if(ARGV.length > 1)
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
    @surname = gets.chomp
  end
end
