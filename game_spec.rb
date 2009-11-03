require 'game'

describe Game do
  before(:each) do
    @game = Game.new(0,"d-d",9.7,"asd","dsa")
  end

  it "should have status of type Fixnum" do
    @game.status.should be_a_kind_of(Fixnum)
  end

  it "should not be abble to edit variables" do
    @game.should_not respond_to(:status=)
    @game.should_not respond_to(:description=)
    @game.should_not respond_to(:ratio=)
    @game.should_not respond_to(:demo=)
    @game.should_not respond_to(:url=)
  end

  it "should have rating from 0.0 to 10.0" do
    @game.rating.should be_between(0.0, 10.0)
    lambda{Game.new(1,"google", 10, "master", "piece")}.should_not raise_error
    lambda{Game.new(1,"google", 10.1, "master", "piece")}.should raise_error
    lambda{Game.new(1,"google", 0, "master", "piece")}.should_not raise_error
    lambda{Game.new(1,"google", -0.1, "master", "piece")}.should raise_error
  end
  
end
