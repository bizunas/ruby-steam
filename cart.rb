require 'GameList'

class Cart
  attr_reader :games
  attr_writer :user
  
  def initialize
    @games = []
  end
  
  def add_game(index)
    gl = GameList.new
    include = false
    @games.each do |game|
      if game.description == gl.games[index-1].description
        include = true
      end
    end
    if !include
      game = gl.games[index-1].clone
      game.status = 0
      @games << game
    end
  end
  
  def to_s
    ret = "Cart entries:\n"
    @games.each_index do |i|
      ret << "------#{i}------\n"
      ret << "#{@games[i]}\n"
    end
    if @games.length == 0
      ret << "0 entries\n"
    end
    ret
  end
end