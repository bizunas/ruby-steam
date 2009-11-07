require 'gameList'

describe GameList do
  before(:each) do
    @game_list = GameList.new
  end

  it "should not be empty" do
    @game_list.games.should_not be_empty
  end

  it "should have at least 2 games" do
    @game_list.games.should have_at_least(2).items
  end

  it "should have valid data for game" do
    @game_list.games.each do |game|
      game.status.should be_kind_of(Fixnum)
      game.description.should be_kind_of(String)
      game.rating.should be_kind_of(Float)
      game.demo_url.should be_kind_of(String)
      game.url.should be_kind_of(String)
    end
  end
  
  it "should be able to print games from the list with filter of status 0" do
    to_string = "Games list:\n"
    @game_list.games.each_index do |i|
      if !(true && @game_list.games[i].status == 0)
        to_string << "-------#{i+1}--------\n"
        to_string << "#{@game_list.games[i].to_s}"
      end
    end
    @game_list.print_games(true).should be_eql(to_string)
  end
  
  it "should be able to print all games from the list without filter of status 0" do
    to_string = "Games list:\n"
    @game_list.games.each_index do |i|
      if !(false && @game_list.games[i].status == 0)
        to_string << "-------#{i+1}--------\n"
        to_string << "#{@game_list.games[i].to_s}"
      end
    end
    @game_list.print_games(false).should be_eql(to_string)
  end
  
  it "should return string of object" do
    to_string = "Games list:\n"
    @game_list.games.each_index do |i|
      to_string << "-------#{i+1}--------\n"
      to_string << "#{@game_list.games[i].to_s}"
    end
    @game_list.to_s.should be_eql(to_string)
  end
end

