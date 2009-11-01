class Game
  attr_accessor :status, :description, :rating, :demo_url, :url
  
  def initialize(status, description, rating, demo_url, url = nil)
    @status = status
    @description = description
    @rating = rating
    @demo_url = demo_url
    @url = url
  end
  
  def to_s
    "------\nStatus:\t#{@status}\nDescription:\n\t#{@description}\nRating:\t#{@rating}\nDemo:\t#{@demo_url}\nFull game:\t#{url}\n------\n\n"
  end
end
