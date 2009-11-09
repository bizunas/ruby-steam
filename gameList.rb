require 'game'

class GameList
  attr_reader :games
  
  def initialize
    
    @games = [Game.new("Half-Life 2", 5, "Good game", 8.7, "50€", "http://www.google.lt/hl2", "http://www.yahoo.com/hl2"),
              Game.new("Half-Life 2 Episode 1", 3, "Better game", 8.6, "72€", "http://www.google.lt/hl2-1", "http://www.yahoo.com/hl2-1"),
              Game.new("Half-Life 2 Episode 2", 0, "Best game", 8.7, "59€", "http://www.google.lt/hl2-2", "http://www.yahoo.com/hl2-2"),
    ]
    load_object
  end

  def add_game(name, status, description, rating, demo, url)
    @games << Game.new(name, status, description, rating, demo, url)
    save_object
  end
  
  def delete_game(id)
    if id <= @games.length
      @games.delete_at(id)
    else
      raise "Bad id for games to delete"
    end
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

  Save_dat = "wh.dat"

  def save_object
    file = File.new(Save_dat, 'w')
    data = Marshal.dump(@games)
    file.write(data)
    file.close
    #File.open(Wh, 'w') {|f| f.write(Marshal.dump(@games))}
  end

  def load_object
    if File.exists? Save_dat
      file = File.open(Save_dat, 'r')
      data = file.read(File.size(Save_dat))
      @games = Marshal.load(data)
      file.close
    else
      false
    end
  end
end
