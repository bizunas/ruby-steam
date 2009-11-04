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
  
  it "should set user name if there are arguments but no parameters" do
    if ARGV.length > 0
      @lf.set_username("")
      @lf.name.should be_eql(ARGV[0])
    end
  end
  
  it "should set user password if there are arguments but no parameters" do
    if ARGV.length > 1
      @lf.set_password("")
      @lf.password.should be_eql(ARGV[1])
    end
  end
end
