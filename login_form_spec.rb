# To change this template, choose Tools | Templates
# and open the template in the editor.

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
    @lf.sex.should match(/Vyras|Moteris/i)
  end
end
