require 'gameList'
require 'matchers'

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
  
  it "should be able to delete game" do
    @game_list.delete_game(0)
    @game_list.games.length.should be_eql(2)
  end
  
  it "should raise error if there is no id for game" do
    ((@game_list.games.length+1..@game_list.games.length+10).to_a).each {|v| lambda {@game_list.delete_game(v)}.should raise_error}
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
  
  #it "should return false if it couldn't load_object" do
  #  File.rename("wh.dat", "wh.dat.bak") if File.exists?("wh.dat")
  #  @game_list.load_object.should be_false
  #  File.rename("wh.dat.bak", "wh.dat") if File.exists?("wh.dat.bak")
  #end

  #it "should save object if file exists" do
  #  File.rename("wh.dat", "wh.dat.bak") if File.exists?("wh.dat")
  #  @game_list.add_game("Halo", 2, "New game.Check it", 8.9, "50$", "none", "none")
  #  @game_list.load_object
  #  File.rename("wh.dat.bak", "wh.dat") if File.exists?("wh.dat.bak")
  #end
  
  #it "should save object after adding new game" do
  #  File.rename("wh.dat", "wh.dat.bak") if File.exists?("wh.dat")
  #  gameList = GameList.new
  #  gameList.add_game("Halo", 1, "Fun game", 7.8, "500$", "none")
  #  gameList.games.length.should be_more_than(1)
  #  File.delete("wh.dat")
  #  File.rename("wh.dat.bak", "wh.dat") if File.exists?("wh.dat.bak")
  #end
end

