require 'account.rb'
require 'digest/md5'

class AccountList
  attr_reader :accounts
  
  def initialize
    @accounts = [Account.new("Admin", "root", "lebowski", "Vyras", 0)]
    load_object
  end

  def add_user(name, password, surname, sex, privileges)
    @accounts << Account.new(name, password, surname, sex, privileges)
    save_object
  end
  
  def get_user(name, pass)
    @accounts.each do |acc|
      if logged_in?(acc.name, acc.password, name, Digest::MD5.hexdigest(pass))
        return acc
      end
    end
    return nil
  end

  def logged_in?(user_expected, pass_expected, user_actual, pass_actual)
    if user_expected == user_actual && pass_expected == pass_actual
      true
    else
      false
    end
  end
  
  def to_s
    ret = "Account list:\n"
    @accounts.each do |acc|
      ret << acc.to_s
    end
    ret
  end
  
  private
  Wh = "acc.dat"

  def save_object
    file = File.new(Wh, 'w')
    data = Marshal.dump(@accounts)
    file.write(data)
    file.close
  end

  def load_object
    if File.exists? Wh
      file = File.open(Wh, 'r')
      data = file.read(File.size(Wh))
      @accounts = Marshal.load(data)
      file.close
    else
      false
    end
  end
end