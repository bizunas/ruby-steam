class News
  attr_reader :news
  def initialize
    
  end
  
  def add_new(title, new, author, published_on)
    @news = []
    news = {}
    news['title'] = title
    news['new'] = new
    news['author'] = author
    news['published_on'] = published_on
    @news += [news]
  end
  
  def to_s
    ret = "Naujienos:\n"
    @news.each do |new|
      ret << "#{new['title']}/autorius: #{new['author']}/data: #{new['published_on']}\n\n#{new['new']}"
    end
    if @news.length == 0
      ret << "tuscia, nera, natha\n"
    end
    ret
  end

end