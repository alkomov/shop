class ItemsController < ApplicationController
  def index
  	@categories = Category.all
    @items = Item.all
    if params[:category_id].present?
  category = Category.find(params[:category_id])
  @items = @items.where(category: category)
  end
end
def add_to_cart
    @item = Item.find(params[:id])
    add_item_to_cart(@item.id)
    redirect_back fallback_location: items_url
  end
  def delete_from_cart
    @item = Item.find(params[:id])
    delete_item_from_cart(@item.id)
    redirect_back fallback_location: carts_path
  end
end