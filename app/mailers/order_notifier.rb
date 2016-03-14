class OrderNotifier < ApplicationMailer

  default from: 'BookShelf <morozhunce@gmail.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.received.subject
  #
  def received(order)
    @order=order
    mail(to: order.email, subject: 'BookShelf Order Confirmation') do |format|
      format.html
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.shipped.subject
  #
  def shipped(order)
    @order=order
    mail(
        to: order.email,
        subject: 'BookShelf Order Shipped',
        from: "BookShelf",
        return_path: "morozhunce@gmail.com",
        date: Time.now,
        template_path: 'order_notifier',
        template_name: 'shipped'
    )
  end

end
