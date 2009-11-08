require 'gameList'

class Server
  attr_reader :name, :game, :players_now, :players_total, :map
  def initialize(name, game, players_total, map)
    @name = name
    found = false

    GameList.new.games.each do |game_from_list|
      if game_from_list.name == game
        found = true
      end
    end
    if found
      @game = game
    else
      raise "No compatible game to create server"
    end
    
    if players_total.class == Fixnum
      @players_total = players_total
    elsif players_total.class == String
      @players_total = players_total.to_i
    else
      raise "Bad players total object"
    end
    @players_now = 0
    @map = map
  end
  
  

end