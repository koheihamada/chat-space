class MessagesController < ApplicationController
  before_action :group_initialize, only:[:index, :create]

  def index
    @messages = @group.messages.where("id > ?", params[:last_message_id])
    @message = Message.new
    respond_to do |format|
      format.html
      format.json
    end
  end



  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージを投稿しました " }
        format.json
      end
    else
      render 'index'
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

  def group_initialize
    @group = Group.find(params[:group_id])
  end


end
