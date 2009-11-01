require 'digest/md5'

class Account
  attr_accessor :name, :surname, :password, :sex, :account_id
  @@id_counter = 0

  def initialize(name, password, surname = nil, sex = nil)
    @name = name
    @surname = surname
    @password = Digest::MD5.hexdigest(password)
    @sex = sex
    @account_id = (@@id_counter += 1)
  end

  def save
    doc = "#{name}|#{surname}|#{password}|#{sex}|#{account_id}\n"
    File.open("accounts.dat", 'a') {|f| f.write(doc) }
  end

  def get_user
    file = File.new("accounts.dat", "r")
    while (line = file.gets)
      line = line.chomp.split(/\|/)
      user_logged_in = logged_in?(line[0], line[2], line[1], line[3]) #line[0] - username, line[2] - password (in md5 form)
      break if user_logged_in
    end
    file.close
    user_logged_in
  end

  def logged_in?(user, pass, surname, sex)
    if user == @name && pass == @password
      @surname = surname
      @sex = sex
      return true
    end
    false
  end
end
