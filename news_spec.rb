require 'server'
require 'news'

describe News do
  
  before(:each) do
    @news = News.new
  end
  
  it "should create array of news" do
    #lambda {
    #  @news.add_new("New game has been given !!!", "new half life game !!! check out in a list !", "bizunas", "2009-11-01")
    #}.should change(@news, :news).by(1)
  end

  it "should create string of object, if it has elements" do
    @news.add_new("New game has been given !!!", "new half life game !!! check out in a list !", "bizunas", "2009-11-01")
    to_string = "Naujienos:\n"
    @news.news.each do |new|
      to_string << "New game has been given !!!/autorius: bizunas/data: 2009-11-01\n\nnew half life game !!! check out in a list !"
    end
    @news.to_s.should be_eql(to_string)
  end
  
end