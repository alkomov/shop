class OrderMailer < ApplicationMailer
  def new_order_mail
    @order = params[:order]
    mail(to: 'al.komov.ak@gmail.com', subject: 'Поступил новый заказ из магазина')
  end

  def order_received_mail
    @order = params[:order]
    mail(to: @order.email, subject: 'Подтверждение заказа в магазине Электрон')
  end
end