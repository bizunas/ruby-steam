require 'rubygems'
require 'spec'
require 'account'
require 'accountList'
require 'loginForm'
require 'matchers'

describe Account do
  before(:each) do
    @account = Account.new("Vardenis", "a", "Pavardenis", "vyras", 0)
  end

  it "should allow create new account for user" do
    @account.should be_instance_of(Account)
  end

  it "should have sex of Vyras or Moteris" do
    @account.sex.should match(/Vyras|Moteris/i)
  end

  it "should have unique account id" do
    other_account = Account.new("Other", "a", "people", "moteris")
    @account.account_id.should_not == other_account.account_id
  end

  it "should have password of md5 form" do
    @account.password.should match(/[0-9A-Fa-f]{32}/i)
  end

  it "should produce string of account" do
    @account.to_s.should == "------\nUser name:\t#{@account.name} #{@account.surname}\nSex:\t#{@account.sex}\nAccount ID:\t#{@account.account_id}\nPrivileges:\t#{@account.privileges}\nMoney balance:\t 0\n\n-----\n\n"
  end
  
  it "should have 0$ when initialized" do
    @account.money.should == 0
  end
  
  
  
  
  describe "money transactions" do
    it "should be able to add money to account" do
      qty = 50
      
      lambda {
        @account.add_money(qty)
      }.should change(@account, :money).from(@account.money).to(@account.money + qty)
    end
  
    it "should not let add negative money" do
      lambda {
        @account.add_money(-10)
      }.should_not change(@account, :money)
    end
  
    it "should be able to subtract money from account" do
      @account.add_money(100)
      
      qty = 50
      
      lambda {
        @account.sub_money(qty)
      }.should change(@account, :money).from(@account.money).to(@account.money - qty)
    end
  
    it "should not let add negative money" do
      lambda {
        @account.add_money(-10)
      }.should_not change(@account, :money)
    end
  
    it "should raise error if there is no money in account to buy game" do
      lambda {
        @account.sub_money(10)
      }.should raise_error
    end
    
    it "should let add money passing value as string" do
      lambda {
        @account.add_money("100")
      }.should change(@account, :money).from(@account.money).to(@account.money + 100)
    end
    
    it "should let add/subtract money passing integer as string" do      
      @account.add_money(100)
      
      lambda {
        @account.sub_money("100")
      }.should change(@account, :money).from(@account.money).to(@account.money - 100)
    end
    
    it "should check if integer is positive" do
      @account.make_abs_int("100").should be_eql(100)
    end
  
    it "should not let add negative money if it is string" do
      lambda {
        @account.add_money("-10")
      }.should_not change(@account, :money)
    end
  end
  
  it "should be from an AccountList" do
    accList = AccountList.new
    acc = Account.new("Vardenis", "a", "Pavardenis", "vyras", 0)
    accList.add_account(acc)
    acc.should be_from_list(accList.accounts)
  end

end
