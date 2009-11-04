require 'digest/md5'
require 'cart.rb'

class Account
  attr_accessor :name, :surname, :password, :sex, :account_id, :cart
  attr_reader :privileges, :money
  @@id_counter = 0

  def initialize(name, password, surname = nil, sex = nil, privileges = 1)
    @name = name
    @surname = surname
    @password = Digest::MD5.hexdigest(password)
    @sex = sex
    @account_id = (@@id_counter += 1)
    @privileges = privileges
    @cart = Cart.new
    @money = 0
  end
  
  def add_money(sum)
    @money += sum
  end
  
  def to_s
    ret = "------\n"
    ret << "User name:\t#{@name} #{surname}\n"
    ret << "Sex:\t#{@sex}\n"
    ret << "Account ID:\t#{@account_id}\n"
    ret << "Privileges:\t#{@privileges}\n"
    ret << "Money balance:\t #{@money}\n\n"
    ret << "-----\n\n"
  end
end