require 'game'

class GameList
  attr_reader :games
  
  def initialize
    @games = []
    file = File.new("games.dat", "r")
    while (line = file.gets)
      line = line.chomp.split(/\|/)
      @games << Game.new(line[0], line[1], line[2], line[3], line[4])
    end
    #puts @games.inspect()
    file.close
  end

end
