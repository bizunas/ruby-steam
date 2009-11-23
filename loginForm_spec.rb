require 'loginForm'

describe LoginForm do
  before(:each) do
    @lf = LoginForm.new("Igoris", "gamer")
  end

  it "should set name from arguments, prompt or stdin" do
    @lf.name.should be_eql("Igoris")
    @lf.name.should_not be_eql("")
  end

  it "should set password from arguments, prompt or stdin" do
    @lf.password.should be_eql("gamer")
    @lf.password.should_not be_eql("")
  end

  it "should have sex of moteris or vyras" do
    @lf.sex = "vyras"
    @lf.sex.should match(/Vyras|Moteris/i)
  end
  
  it "should set user name" do
    @lf.set_username("","burokas")
    @lf.name.should be_eql("burokas")
  end
  
  it "should set password" do
    @lf.set_password("","burokas")
    @lf.password.should be_eql("burokas")
  end
  
  it "should set surname" do
    @lf.set_surname("","burokas")
    @lf.surname.should be_eql("burokas")
  end
  
  it "should set privileges" do
    @lf.set_privileges("",10)
    @lf.privileges.should be_eql(10)
  end
  
  it "should be able to set privileges as string to integer" do
    @lf.set_privileges("","10")
    @lf.privileges.should be_eql(10)
  end
  
  it "should set user name if there are arguments but no parameters" do
    if ARGV.length > 0
      @lf.set_username("")
      @lf.name.should be_eql(ARGV[0])
    end
  end
  
  it "should be able to set privileges to 0 if string is \"0\"" do
    @lf.privileges_check("0").should be_eql(0)
  end
  
  it "should be able to set privileges to 1 if anything else fails" do
    @lf.privileges_check("0").should be_eql(0)
  end
  
  it "should be able to set privileges to 1 if anything else fails" do
    @lf.privileges_check("bad").should be_eql(1)
  end
  
  it "should set user password if there are arguments but no parameters" do
    if ARGV.length > 1
      @lf.set_password("")
      @lf.password.should be_eql(ARGV[1])
    end
  end
  
  it "should let user enter username if it wasnt specified earlier" do
    user = 'foo'
    STDIN.stub(:gets).and_return('foo')
    lf = LoginForm.new(nil,nil,1)
    lf.set_username("",nil)
    lf.name.should be_eql(user)
  end
  
  it "should let user enter password if it wasnt specified earlier" do
    pass = 'foo'
    STDIN.stub(:gets).and_return('foo')
    lf = LoginForm.new(nil,nil,1)
    lf.set_password("",nil)
    lf.password.should be_eql(pass)
  end
  
  it "should let user enter surname if it wasnt specified earlier" do
    surname = 'foo'
    STDIN.stub(:gets).and_return('foo')
    lf = LoginForm.new(nil,nil,1)
    lf.set_surname("",nil)
    lf.surname.should be_eql(surname)
  end
  
  
  it "should let administrator enter privileges for user if it wasnt specified earlier" do
    priv = 0
    STDIN.stub(:gets).and_return("0")
    lf = LoginForm.new(nil,nil,1)
    lf.set_privileges("",nil)
    lf.privileges.should be_eql(priv)
  end
end
