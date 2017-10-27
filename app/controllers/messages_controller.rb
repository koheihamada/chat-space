class MessagesController < ApplicationController
  before_action :group_initialize, only:[:index]

  def index
    @message = Message.new
  end



  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: "メッセージを投稿しました "
    else
      render 'index'
    end

  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

  def group_initialize
    @group = Group.order(created_at: :desc).find(params[:group_id])
  end


end
