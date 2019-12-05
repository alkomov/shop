class ItemsController < ApplicationController
  def index
  	@categories = Category.all
    @items = Item.all
    if params[:category_id].present?
  category = Category.find(params[:category_id])
  @items = @items.where(category: category)
end
  end
end