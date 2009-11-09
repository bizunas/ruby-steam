require 'server'
require 'gameList'
require 'matchers'

describe Server do
  
  before(:each) do
    @server = Server.new("Mustafa", "Half-Life 2", 32, "de_zealot")
  end
  
  it "should have game from games list" do
    gl = GameList.new
    names = []
    gl.games.each do |game|
      names << game.name
    end
    @server.game.should be_from_list(names)
    #names.should include(@server.game)
  end

  it "should rasie error if there is no game for server" do
    lambda { Server.new("Mustafa", "No game in List", 32, "de_zealot") }.should raise_error
  end

  it "should be able to add integer from string for players_total" do
    server = Server.new("Mustafa", "Half-Life 2", "32", "de_zealot")
    server.players_total.should be_eql(32)
  end
  
  it "should raise error if players_total is not fixnum or string" do
    lambda {Server.new("Mustafa", "Half-Life 2", 10.5, "de_zealot") }.should raise_error
  end
  
  it "should not have more players than it can hold" do
    @server.players_total.should be_more_than(@server.players_now)
  end
  
  it "should have more total players than now playing" do
    @server.players_now.should_not be_more_than(@server.players_total)
  end

  
end