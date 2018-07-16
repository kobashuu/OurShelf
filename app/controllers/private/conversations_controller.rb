class Private::ConversationsController < ApplicationController

  def create
    recipient_id = Post.find(params[:post_id]).user.id
    conversation = Private::Conversation.new(sender_id: current_user.id,
                                             recipient_id: recipient_id)
    if conversation.save
      add_to_conversations unless already_added?
      Private::Message.create(user_id: recipient_id,
                              conversation_id: conversation.id,
                              body: params[:message_body])
      respond_to do |format|
        format.js {render partial: 'app/views/users/success'}
      end
    else
      respond_to do |format|
        format.js {render partial: 'app/views/users/fail'}
      end
    end
  end

  private

    def add_to_conversations
      session[:private_conversations] ||= []
      session[:private_conversations] << @conversation.id
    end

    def already_added?
      session[:private_conversations].include?(@conversation.id)
    end


end
