require 'digest/md5'

class Account
  attr_accessor :name, :surname, :password, :sex, :account_id
  attr_reader :privileges
  @@id_counter = 0

  def initialize(name, password, surname = nil, sex = nil, privileges = 1)
    @name = name
    @surname = surname
    @password = Digest::MD5.hexdigest(password)
    @sex = sex
    @account_id = (@@id_counter += 1)
    @privileges = privileges
  end
  
  def to_s
    ret = "------\n"
    ret << "User name:\t#{@name} #{surname}\n"
    ret << "Sex:\t#{@sex}\n"
    ret << "Account ID:\t#{@account_id}\n"
    ret << "Privileges:\t#{@privileges}\n"
    ret << "-----\n"
  end
end