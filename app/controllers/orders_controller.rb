class OrdersController < ApplicationController
  def create
    @order = Order.new(create_params.merge(item_ids: current_cart.join(',')))
    if @order.save
      cookies.delete(:cart)
      redirect_to success_order_path(@order)
    else
      redirect_to carts_path
    end
  end
  def create
    @order = Order.new(create_params.merge(item_ids: current_cart.join(',')))
    if @order.save
      OrderMailer.with(order: @order).new_order_mail.deliver_later
      OrderMailer.with(order: @order).order_received_mail.deliver_later
      cookies.delete(:cart)
      redirect_to success_order_path(@order)
    else
      redirect_to carts_path
    end
  end

  def success
    @order = Order.find(params[:id])
  end

  private

  def create_params
    params.require(:order).permit(:phone, :email, :name)
  end
end