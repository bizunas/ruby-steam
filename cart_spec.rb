require 'cart'

describe 'Cart' do
  before(:each) do
    @cart = Cart.new
  end

  it "should be able to add game" do
    @cart.games.length.should be_eql(0)
    @cart.add_game(1)
    @cart.games.length.should be_eql(1)
  end
  
  it "should not let add same game" do
    @cart.games.length.should be_eql(0)
    @cart.add_game(1)
    @cart.games.length.should be_eql(1)
    @cart.add_game(1)
    @cart.games.length.should be_eql(1)
  end
  
  it "should make sure to make status 0 of added game" do
    length = @cart.games.length
    @cart.add_game(1)
    @cart.games[@cart.games.length-1].status.should be_eql(0)
  end
  
  it "should return string of object" do
    @cart.add_game(1)
    to_string = "Cart entries:\n"
    @cart.games.each_index do |i|
      to_string << "------#{i}------\n"
      to_string << "#{@cart.games[i]}\n"
    end    
    @cart.to_s.should be_eql(to_string)
	end
  
  it "should return '0 entries' for empty cart" do
    to_string = "Cart entries:\n0 entries\n"
    @cart.to_s.should be_eql(to_string)
  end
end