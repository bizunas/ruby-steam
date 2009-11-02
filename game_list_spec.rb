require 'gameList'

describe GameList do
  before(:each) do
    @game_list = GameList.new
  end

  it "should not be empty" do
    @game_list.games.should_not be_empty
  end

  it "should have at least 2 games" do
    @game_list.games.should at_least_have(2)
  end

  it "should have valid data for game" do
    @game_list.games[0].status.should be_kind_of(Fixnum)
    @game_list.games[0].description.should be_kind_of(String)
    @game_list.games[0].rating.should be_kind_of(Float)
    @game_list.games[0].demo_url.should be_kind_of(String)
    @game_list.games[0].url.should be_kind_of(String)
  end
end

