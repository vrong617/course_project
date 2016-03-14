# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification/received
  def received
    Notification.received
  end

  # Preview this email at http://localhost:3000/rails/mailers/notification/shipped
  def shipped
    Notification.shipped
  end

end
