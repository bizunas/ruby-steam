require 'server'
require 'gameList'

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
    names.should include(@server.game)
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
    #TODO: custom matcher
  end

  
end