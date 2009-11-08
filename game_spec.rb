require 'game'

describe Game do
  before(:each) do
    @game = Game.new("Half-Life® 2", 0,"d-d",9.7, "50ˆ","asd","dsa")
  end

  it "should have status of type Fixnum" do
    @game.status.should be_a_kind_of(Fixnum)
  end

  it "should not be abble to edit variables excep status" do
    @game.should respond_to(:status=)
    @game.should_not respond_to(:description=)
    @game.should_not respond_to(:ratio=)
    @game.should_not respond_to(:demo=)
    @game.should_not respond_to(:url=)
  end

  it "should have rating from 0.0 to 10.0" do
    @game.rating.should be_between(0.0, 10.0)
  end
  
  it "should raise error if rating is more than 10.0" do
    lambda{Game.new("H-L", 1,"google", 10.1, "50ˆ", "master", "piece")}.should raise_error
  end
  
  it "should not raise error if rating is between 0.0 and 10.0" do
    lambda{Game.new("H-L", 1,"google", 10, "50ˆ", "master", "piece")}.should_not raise_error
    lambda{Game.new("H-L", 1,"google", 0, "50ˆ", "master", "piece")}.should_not raise_error
  end
  
  it "should raise error if rating is less than 0.0" do
    lambda{Game.new("H-L", 1,"google", -0.1, "50ˆ", "master", "piece")}.should raise_error
  end
  
  it "should allow rating with string form" do
    lambda{Game.new("H-L", 1,"google", "7.7", "50ˆ", "master", "piece")}.should_not raise_error
    lambda{Game.new("H-L", 1,"google", "10.1", "50ˆ", "master", "piece")}.should raise_error
  end
  
  it "should set status of no more than 7" do
    ((0..7).to_a).each do |v|
      lambda { Game.new("H-L", v, "d-d", 9.7, "50ˆ", "asd", "dsa") }.should_not raise_error
    end
    ((-10..10).to_a - (0..7).to_a).each do |v|
      lambda { Game.new("H-L", v, "d-d", 9.7, "50ˆ", "asd", "dsa") }.should raise_error
    end
  end
  
  it "should let insert Game's status as String" do
    game = Game.new("H-L", "1","google", 10, "50ˆ", "master", "piece")
    game.status.should be_eql(1)
    game.status.should_not be_eql("1")
  end
  
  it "should return string of object" do
    to_string = "------\nName:\tHalf-Life® 2\nStatus:\t0\nDescription:\n\td-d\nRating:\t9.7\nCost:\t50ˆ\nDemo:\tasd\nFull game:\tdsa\n------\n\n"
    @game.to_s.should be_eql(to_string)
	end
  
  it "should set cost of game" do
    @game.cost.should be_eql("50ˆ")
  end
  
  it "should raise error if passing money other than String" do
    lambda { 
      Game.new("H-L", 5, "d-d", 9.7, 50, "asd", "dsa") 
    }.should raise_error
  end
end
