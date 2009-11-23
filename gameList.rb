require 'game'
require 'saveObjectState'

class GameList
  attr_accessor :games, :data_file
  
  def initialize
    
    @data_file = "wh.dat"
    
    @games = [Game.new("Half-Life 2", 5, "Good game", 8.7, "50€", "http://www.google.lt/hl2", "http://www.yahoo.com/hl2"),
              Game.new("Half-Life 2 Episode 1", 3, "Better game", 8.6, "72€", "http://www.google.lt/hl2-1", "http://www.yahoo.com/hl2-1"),
              Game.new("Half-Life 2 Episode 2", 0, "Best game", 8.7, "59€", "http://www.google.lt/hl2-2", "http://www.yahoo.com/hl2-2"),
    ]
    @games = load()
  end

  def add_game(name, status, description, rating, cost, demo, url)
    @games << Game.new(name, status, description, rating, cost, demo, url)
  end
  
  def delete_game(id)
    if id <= @games.length
      @games.delete_at(id)
    else
      raise "Bad id for games to delete"
    end
  end
  
  def save(object)
    save_obj = SaveObjectState.new.save_object(@data_file, object)
  end
  
  def load()
    if (@games = SaveObjectState.new.load_object(@data_file)) == false
      @games = [Game.new("Half-Life 2", 5, "Good game", 8.7, "50€", "http://www.google.lt/hl2", "http://www.yahoo.com/hl2"),
                Game.new("Half-Life 2 Episode 1", 3, "Better game", 8.6, "72€", "http://www.google.lt/hl2-1", "http://www.yahoo.com/hl2-1"),
                Game.new("Half-Life 2 Episode 2", 0, "Best game", 8.7, "59€", "http://www.google.lt/hl2-2", "http://www.yahoo.com/hl2-2"),
                ]
    end
    return @games
  end
  
  def print_games(wo_zero = false)
    ret = "Games list:\n"
    @games.each_index do |i|
      if !(wo_zero && @games[i].status == 0)
        ret << "-------#{i+1}--------\n"
        ret << "#{@games[i].to_s}"
      end
    end
    ret
  end
  
  def to_s(wo_zero = false)
    ret = "Games list:\n"
    @games.each_index do |i|
      ret << "-------#{i+1}--------\n"
      ret << "#{@games[i].to_s}"
    end
    ret
  end
end
