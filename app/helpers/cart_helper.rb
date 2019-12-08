module CartHelper
  def current_cart
    if cookies[:cart].present?
      cookies[:cart].split(',').map(&:to_i)
    else
      []
    end
  end

  def add_item_to_cart(item_id)
    cookies[:cart] = current_cart.push(item_id).join(',')
  end
  def delete_item_from_cart(item_id)
    new_cart = current_cart
    item_index = current_cart.index(item_id)
    if item_index
      new_cart.delete_at(item_index)
      cookies[:cart] = new_cart.join(',')
    end
  end
end