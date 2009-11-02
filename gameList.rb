require 'game'

class GameList
  attr_reader :games
  
  def initialize
    
    @games = [Game.new(10, "Half-Life® 2", 8.7, "http://www.google.lt/hl2", "http://www.yahoo.com/hl2"),
              Game.new(3, "Half-Life® 2 Episode 2", 8.7, "http://www.google.lt/hl2-2", "http://www.yahoo.com/hl2-2"),
    ]
    load_object
    #end

    #file = File.new("games.dat", "r")
    #while (line = file.gets)
    #  line = line.chomp.split(/\|/)
    #  @games << Game.new(line[0], line[1], line[2], line[3], line[4])
    #end
    #puts @games.inspect()
    #file.close
  end

  def add_game(status, description, rating, demo, url)
    @games << Game.new(status, description, rating, demo, url)
    save_object
  end

  private
  Wh = "wh.dat"

  def save_object
    file = File.new(Wh, 'w')
    data = Marshal.dump(@games)
    file.write(data)
    file.close
    #File.open(Wh, 'w') {|f| f.write(Marshal.dump(@games))}
  end

  def load_object
    if File.exists? Wh
      file = File.open(Wh, 'r')
      data = file.read(File.size(Wh))
      @games = Marshal.load(data)
      file.close
    else
      false
    end
  end
end
