# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 
require 'rubygems'
require 'spec'
require 'account'
require 'loginForm'

describe Account do
  before(:each) do
    @account = Account.new("Vardenis", "a", "Pavardenis", "vyras")
  end

  it "should allow create new account for user" do
    @account.should be_instance_of(Account)
  end

  it "owners sex should be Vyras or Moteris" do
    @account.sex.should match(/Vyras|Moteris/i)
  end

  it "should have unique account id" do
    other_account = Account.new("Other", "a", "people", "moteris")
    @account.account_id.should_not == other_account.account_id
  end

  it "should have password of md5 form" do
    @account.password.should match(/[0-9A-Fa-f]{32}/i)
  end

  it "should check if person has been registered" do
    @account.get_user.should be_true
  end

end
