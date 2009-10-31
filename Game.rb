# To change this template, choose Tools | Templates
# and open the template in the editor.

class Game
  attr_accessor :status, :description, :rating, :demo_url, :url
  def initialize(status, description, rating, demo_url, url = nil)
    @status = status
    @description = description
    @rating = rating
    @demo_url = demo_url
    @url = url
  end
end
