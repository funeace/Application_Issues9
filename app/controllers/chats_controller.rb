class ChatsController < ApplicationController
  def show
    @user = current_user
    # 結合結果のroom情報から、idを取得
    @room = Room.find(params[:id])


    # 会議室のチャットを一覧表示
    @chats = @room.chats
    # binding.pry
    @chat = Chat.new
  end

  def make_room
        @user = User.find(params[:user_id])
      #roomを作成
        @new_room = Room.create()
      #relationを作成
        UserRoom.create(user_id: @user.id ,room_id: @new_room.id)
        UserRoom.create(user_id: current_user.id ,room_id: @new_room.id)
        redirect_to chat_path(@new_room)
  end

  def create
    @room = Room.find(params[:chat][:room_id])
    @chats = @room.chats
    @message = current_user.chats.create(chat_params)
    # byebug.pry
  end

  private
  def chat_params
    params.require(:chat).permit(:user_id,:room_id,:message)
  end
end
