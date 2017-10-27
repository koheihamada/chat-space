class MessagesController < ApplicationController
  before_action :group_initialize

  def index
    @message = Message.new

  end



  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to group_messages_path, notice: "メッセージを投稿しました "
    else
      render 'index'
    end

  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def group_initialize
    @group = Group.order(created_at: :desc).find(params[:group_id])
  end


end
