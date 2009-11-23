require 'saveObjectState'
require 'accountList'
require 'matchers'

describe SaveObjectState do
  before(:each) do
    @saver = SaveObjectState.new
  end

  it "should should create new file to store object state" do
    object = AccountList.new
    file = "sandbox.dat"
    @saver.save_object(file, object)
    File.exists?(file).should be_true    
    File.delete(file) if File.exists?(file)
  end
  
  it "should be able to save object state to file and load from it" do
    object = AccountList.new
    file = "sandbox.dat"
    @saver.save_object(file, object)
    object_from_file = @saver.load_object(file)
    File.delete(file) if File.exists?(file)
    
    object.to_s.should be_eql(object_from_file.to_s)
  end
  
end