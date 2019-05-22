class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
  end

  def link_through
    @notification = Notification.find(params[:id])
    @notification.update read: true
     redirect_to user.find(params[:id])
    end
    user = @noticication.user
    book = user.books.find(@notification.book_id)
    book.reader_id = @notification.notified_by.id
    book.save
  end
end
