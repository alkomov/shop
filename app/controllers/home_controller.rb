class HomeController < ApplicationController
  def index
  	@name = 'Александр'
  end
end
class HomeController < ApplicationController
  def index
    @items = Item.all.limit(6)
  end
end