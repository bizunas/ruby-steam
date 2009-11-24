require 'account'

class LoginForm
  attr_accessor :name, :surname, :password, :sex, :privileges

  def initialize(name = nil, password = nil, arg = 0)
    @name = name
    @password = password
    @arg = arg
  end

  def set_username(name = nil)
    if name != nil then
      @name = name
    elsif(ARGV.length > 0 && @arg == 0) then
      @name = ARGV[1]
    end
  end

  def set_password(password = nil)
    if password != nil
      @password = password
    elsif(ARGV.length > 1 && @arg == 0)
      @password = ARGV[2]
    end
  end
  
  def set_privileges(priv = nil)
    if priv != nil
      @privileges = privileges_check(priv)
    end
  end
  
  def privileges_check(priv)
    if priv != "0"
      if priv.to_i > 0
        privileges = priv.to_i
      else
        privileges = 1
      end
    else
      privileges = 0
    end
    privileges
  end
end
