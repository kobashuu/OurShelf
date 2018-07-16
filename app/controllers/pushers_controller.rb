class PushersController < ApplicationController
  protect_from_forgery :except => :auth # stop rails CSRF protection for this action

  def auth
    if current_user
      response = Pusher[params[:channel_name]].authenticate(params[:socket_id])
      render :json => response
      flash[:success] = "貸出リクエストを送信しました"
    else
      render :text => "Not authorized", :status => '403'
    end
  end

  def push
    Pusher['private-'+current_user.id.to_s].trigger('new_message', {:sender => current_user.name, :link => "/chatroom/123"})
    render nothing: true
  end

end
