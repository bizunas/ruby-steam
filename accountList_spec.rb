require 'rubygems'
require 'spec'
require 'accountList'
require 'loginForm'
require 'matchers'

describe AccountList do
  before(:each) do
    @account_list = AccountList.new
    @accounts = @account_list.accounts
    @file = "acc.dat"
  end
  
  it "should return account object for get_user" do
    @account_list.get_user("Admin", "root").should_not be_nil
  end
  
  it "should be able to add account to list" do
    acc = Account.new("Vardenis", "a", "Pavardenis", "vyras", 0)
    @account_list.add_account(acc)
    acc.should be_from_list(@accounts)
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
  
  it "should return Admin account if it couldn't load object" do
    file = "acc.dat"
    File.rename(file, file + ".bak") if File.exists?(file)
    @account_list.load().should be_instance_of(Array)
    File.rename(file + ".bak", file) if File.exists?(file + ".bak")
  end

  it "should save object if file exists" do
    file = "acc.dat"
    File.rename(file, file + ".bak") if File.exists?(file)
    @account_list.add_user("Admin", "root", "lebowski", "Vyras", 0)
    @account_list.save(@account_list.accounts)
    File.rename(file + ".bak", file) if File.exists?(file + ".bak")
  end
  
  it "should save object after adding new account" do
    file = "acc.dat"
    File.rename(file, file + ".bak") if File.exists?(file)
    @account_list.add_user("Admin", "root", "lebowski", "Vyras", 0)
    @account_list.save(@account_list.accounts)
    @account_list.accounts.length.should be_more_than(1)
    File.delete(file)
    File.rename(file + ".bak", file) if File.exists?(file + ".bak")
  end
end