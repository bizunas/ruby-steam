require 'rubygems'
require 'spec'
require 'accountList'
require 'loginForm'

describe AccountList do
  before(:each) do
    @account_list = AccountList.new
    @accounts = @account_list.accounts
  end

  it "should return account object for get_user" do
    @account_list.get_user("Admin", "root").should_not be_nil
  end
  
  it "should have Administrator in accounts" do
    @accounts.should include(@account_list.get_user("Admin", "root"))
  end
  
  it "should be in DB if user wants to login" do
    @account_list.get_user("Admin", "root").should be_kind_of(Account)
  end
  
  it "should not contain non existing user" do
    not_registered_account = Account.new("bbbbbbbbbbbbbb", "cccccccccccc", "asdasd", "Vyras")
    @accounts.should_not include(not_registered_account)
  end
  
  it "should return nil object if there is no user in DB" do
	not_registered_account = Account.new("bbbbbbbbbbbbbb", "cccccccccccc", "asdasd", "Vyras")
	@account_list.get_user("bbbbbbbbbbbbbb", "cccccccccccc").should be_nil
  end
  
  it "should have same name and password as in DB" do
    @account_list.logged_in?("google","asd","google","asd").should be_true
  end
  
  it "should not have user if it doesn't exist in DB" do
    @account_list.logged_in?("vardenis", "mmm", "pavardenis", "mmm").should be_false
  end
  
  it "should return string of object" do
    to_string = "Account list:\n"
    @accounts.each do |acc|
      to_string << acc.to_s
    end

    @account_list.to_s.should be_eql(to_string)
  end
end