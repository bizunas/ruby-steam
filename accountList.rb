require 'account.rb'
require 'digest/md5'
require 'saveObjectState'

class AccountList
  attr_reader :accounts, :storage
  
  def initialize
    @storage = "acc.dat"
    @accounts = [Account.new("Admin", "root", "lebowski", "Vyras", 0)]
    @accounts = load()
  end

  def add_account(acc)
    @accounts << acc
  end
  
  def add_user(name, password, surname, sex, privileges)
    @accounts << Account.new(name, password, surname, sex, privileges)
  end
  
  def save(object)
    save_obj = SaveObjectState.new.save_object(@storage, object)
  end
  
  def load()
    if (@accounts = SaveObjectState.new.load_object(@storage)) == false
      @accounts = [Account.new("Admin", "root", "lebowski", "Vyras", 0)]
    end
    
    biggest = 0
    @accounts.each do |acc|
      biggest = acc.account_id if acc.account_id > biggest
    end
    Account.new("Admin", "root").set_id(biggest)
    return @accounts
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
end