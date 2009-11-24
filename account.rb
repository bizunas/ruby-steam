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
  
  def make_abs_int(sum)
    if sum.class == Fixnum
      if sum < 0 
        sum = 0
      end
    else
      sum = sum.to_i
      if sum.to_i < 0 
        sum = 0
      end
    end
    sum
  end
  
  def add_money(sum)
    sum = make_abs_int(sum)
    @money += sum
  end
  
  def sub_money(sum)
    sum = make_abs_int(sum)
    if sum > @money
      raise "not enough money in account"
    end
    @money -= sum
  end
  
  def set_id(id)
    @@id_counter = id
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